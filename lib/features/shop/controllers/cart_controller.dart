import 'package:e_commerce/features/shop/controllers/product/variation_controller.dart';
import 'package:e_commerce/features/shop/models/cart_item_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:e_commerce/utils/local_storage/storage_utility.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt numberOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  final variationController = VariationController.instance;

  CartController(){
    loadCartItems();
  }

  // Add items in the cart
  void addToCart(ProductModel product){
    // Quantity Check
    if (productQuantityInCart.value < 1) {
      Loaders.customToast(message: 'Cantidad Seleccionada');
      return;
    }

    // Variation Selected?
    if (product.productType == ProductType.variable.toString() && variationController.selectedVariation.value.id.isEmpty) {
      Loaders.customToast(message: 'Variante Seleccionada');
    }

    // Out of Stock Status
    if (product.productType == ProductType.variable.toString()) {
      if(variationController.selectedVariation.value.stock < 1){
        Loaders.warningSnackBar(title: 'Oh No!', message: 'Esta Variante no tiene Stock');
        return;
      }
    }else{
      if (product.stock < 1) {
        Loaders.warningSnackBar(title: 'Oh No!', message: 'El Producto seleccionado no tiene Stock');
        return;
      }
    }

    // Convert the ProductModel to a CartItemModel with the given quantity
    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);

    // Check if already added in the Cart
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == selectedCartItem.productId && cartItem.variationId == selectedCartItem.variationId);

    if(index >= 0){
      // This quantity is already addes or Updated/Removed from the design (Cart)(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    }else{
      cartItems.add(selectedCartItem);
    }
  
    updateCart();
    Loaders.customToast(message: 'Your Product has been added to the Cart.');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);
    
    if(index >= 0){
      cartItems[index].quantity += 1;
    }else{
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);
    
    if(index >= 0){
      if(cartItems[index].quantity > 1){
        cartItems[index].quantity -= 1;
      }else{
        // Show dialog before completely removing
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title : 'Eliminar Productos',
      middleText: 'Estas seguro de quitar este producto?',
      onConfirm: (){
        cartItems.removeAt(index);
        updateCart();
        Loaders.customToast(message: 'Product removed from the Cart.');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  // Initialize already added Item's Count in the cart
  void updateAlreadyAddedProductCount(ProductModel product){
    // If product has no variation then calkculate cartEntries and display total number.
    // Else make default entries to 0 and show cartEntries when variation is selected
    if(product.productType == ProductType.single.toString()){
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    }else{
      // Get selected Variation if any...
      final variationId = variationController.selectedVariation.value.id;
      if(variationId.isNotEmpty){
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      }else{
        productQuantityInCart.value = 0;
      }
    }
  }

  // This function convert a ProductModel to a CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity){
    if (product.productType == ProductType.single.toString()) {
      // Reset Variationn in case of single product type
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
      ? variation.salePrice > 0.0
        ? variation.salePrice
        : variation.price
      : product.salePrice > 0.0
        ? product.salePrice
        : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for(var item in cartItems){
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    numberOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemString = cartItems.map((item) => item.toJson()).toList();
    LocalStorage.instance().saveData('cartItems', cartItemString);
  }

  void loadCartItems() {
    final cartItemString = LocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemString != null) {
      cartItems.assignAll(
        cartItemString.map(
          (item) => CartItemModel.fromJson(item as Map<String, dynamic>),
        ),
      );
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );

    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

}