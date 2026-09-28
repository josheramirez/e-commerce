import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:e_commerce/dummy_data.dart';
import 'package:e_commerce/features/shop/controllers/product_market/post_controller.dart';
import 'package:e_commerce/features/shop/models/post_model.dart';
import 'package:e_commerce/features/shop/models/product_market_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key, required this.product});
  
  final ProductMarketModel product;


  void showSimpleDialog(BuildContext context) {
      var simpleDialog = SimpleDialog(
        title: Text('Choose a language'),
        children: [
          SimpleDialogOption(
            child: Text('English'),
            onPressed: () {
              print("English Selected Selected!");
              Navigator.pop(context); // Pass value on press
            },
          ),
          SimpleDialogOption(
            child: Text('Spanish'),
            onPressed: () {
              print("Spanish Selected!");
              Navigator.pop(context); // Pass value on press
            },
          ),
        ],
      );

      showDialog(
          context: context,
          builder: (context) {
            return simpleDialog;
          }
      );
    }

  void showAlertDialog(BuildContext context, ProductMarketModel product, List<String> stores ) {

    // 1. Create a GlobalKey to track and validate the form
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController inputController = TextEditingController();
    
    final priceController = TextEditingController();
    final commentController = TextEditingController();
    final storeNameController = TextEditingController();
    final storeAddressController = TextEditingController();

    final controller = PostController.instance;

    String _selectedValue = product.store!.name;
    RxBool addStore = false.obs;

    showDialog(
      context: context,
      barrierDismissible: false, // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          //  insetPadding: EdgeInsets.zero, 
          title: const Text('Lo viste mas barato?'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevents the dialog from filling the entire screen
              children: [

                // [PRODUCT DETAILS]
                Row(
                  children: [
                    Text('Producto : '),
                    Text(product.name),
                  ],
                ),
                Row(
                  children: [
                    Text('Precio actual : '),
                    Text(product.price.toString()),
                  ],
                ),
                SizedBox(height: 15),

                // [PRICE - STORE]
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // [PRICE]
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Precio :'),
                        SizedBox(
                            width: 75,
                            height: 35,
                            child: TextFormField(
                              controller: priceController,
                              textAlign: TextAlign.left, 
                              keyboardType: TextInputType.number, // Shows numeric keyboard
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly, // Permits only numbers 0-9
                              ],
                              decoration: InputDecoration(
                                
                                // labelText: "Enter Integer",
                                  errorStyle: TextStyle(
                                  fontSize: 0.0,        // Change text size
                                  fontWeight: FontWeight.normal, // Optional: make it bold
                                  
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                ) ,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'requerido';
                                }
                                
                                final numValue = num.tryParse(value);
                                if (numValue == null) {
                                  return 'Please enter a valid number';
                                }
                                
                                // Set your minimum value constraint here
                                // if (numValue < 10000){
                                //   return 'precio max. 10.000';
                                // }
                                
                                return null; // Return null if the input is valid
                              },
                            ),
                          )
                        ],
                    ),
                    
                    // [STORE]
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Local : '),
                        SizedBox(
                            height: 35,
                            width: 150,
                            child:  
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  // labelText: "Enter Integer",
                                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                                initialValue: _selectedValue,
                                items: [...stores , 'Otro...']
                                    .map((option) => DropdownMenuItem(
                                          value: option,
                                          child: Text(option),
                                        ))
                                    .toList(),
                                onChanged: (value) {

                                  print('onChange : $value');
                                  
                                  if (value == 'Otro...') {
                                    addStore.value = true;
                                  }else{
                                    addStore.value = false;
                                  }
                                },
                                // validator: (value) {
                                //   if (value == null) {
                                //     return 'Please select an option';
                                //   }
                                //   return null;
                                // },
                                  ),
                                
                        )
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 5),

                // [COMMENTS]
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Comentario : '),
                    TextFormField(
                      controller: commentController,
                      style:TextStyle(fontSize:14),
                      maxLength: 50,
                      keyboardType: TextInputType.multiline,
                      minLines: 2, // Always stays exactly 6 lines tall
                      maxLines: 2, 
                      decoration: InputDecoration(
                          // labelText: "Enter Integer",
                          // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                      ),
                    )
                  ],
                ),
                // SizedBox(height: 5),
                
                // [NEW STORE]
                Obx(
                  () => Visibility(
                      visible: addStore.value,
                      child: 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Nombre del Local : '),
                            SizedBox(
                                height: 35,
                                child: TextFormField(
                                  controller: storeNameController,
                                  decoration: InputDecoration(
                                    // labelText: "Enter Integer",
                                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                    ),
                                  ),
                                
                                ),
                            ),
                            SizedBox(height: 5),

                            const Text('Direccion : '),
                            SizedBox(
                                height: 35,
                                child: TextFormField(
                                  controller: storeAddressController,
                                  decoration: InputDecoration(
                                    // labelText: "Enter Integer",
                                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                    ),
                                  ),
                                
                                ),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                          
                  ),
                ),
    
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // Apply 16 pixels of vertical padding and 32 pixels of horizontal padding
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              ),
              onPressed: () {
                // 4. Validate the form on submission
                if (formKey.currentState!.validate()) {
                  String price = priceController.text;
                  String comment = commentController.text;
                  String storeAddress = addStore.value? storeAddressController.text : '';
                  String storeName = addStore.value? storeNameController.text : _selectedValue;
                  
print(price);
print(comment);
print(storeAddress);
print(storeName);

                  controller.savePost(price, comment, addStore.value, storeName, storeAddress, product.id);

                  // Close the dialog and optionally pass the data back
                  Navigator.pop(context, 'data save...');
                }
              },
              child: const Text('Publicar'),
            ),
          ],
        );
      },
    );
  }

  void showFullScreenDialog(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false, // Allows content to cover system status/nav bars
      builder: (BuildContext context) {
        return Dialog.fullscreen(
          backgroundColor: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Full-Screen Dialog'),
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(), // Close dialog
              ),
            ),
            body: const Center(
              child: Text('This dialog covers the entire screen.'),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    print('product: ${product.toJson()}');

    final controller = Get.put(PostController());
    controller.getAllPost(product.id);
    controller.getProductFeedback(product.post as PostModel);
    final stores = DummyData.stores.map((store) => store.name).toList();

    print('stores : ${stores.toString()}');


    return Scaffold(
       appBar: UAppBar(
          title: Text(product.name, style: Theme.of(context).textTheme.headlineMedium),
          showBackArrow: true,
          actions: [
            GestureDetector(
              onTap: () => showAlertDialog(context, product, stores),
              child: Row(
                children: [
                  // Text('Nuevo comentario'),
                  Icon(Iconsax.add_circle_copy),
                ],
              ),
            )
          ],
        ),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Text('Comentarios : '),
              SizedBox(height: 10,),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.allPost.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // default white
                              borderRadius: BorderRadius.circular(16), // default 16, which is card radius large
                              border: Border.all(color: Colors.black) // white color default
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      
                                      // [CREATED AT]
                                      // Row(
                                      //   crossAxisAlignment: CrossAxisAlignment.end,
                                      //   children: [
                                      //         Spacer(),
                                      //         Text(DateFormat("d MMMM", "es").format(controller.allPost[index].timestamp), style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold)),
                                      //       ],
                                      // ),
                                      // SizedBox(height: 5),

                                      // [USER DATA - FEEDBACK]
                                      Container(
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(controller.allPost[index].user.fullName, style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold)),
                                                SizedBox(width: 5,),
                                                Text('('),
                                                Text(DateFormat("d MMMM", "es").format(controller.allPost[index].timestamp), style: TextStyle(fontSize: 12.0)),
                                                Text(')'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Iconsax.like_1_copy, size: 20,),
                                                SizedBox(width: 5,),
                                                Text(controller.allPost[index].positiveFeedback.toString()),
                                                SizedBox(width: 15,),
                                                Icon(Iconsax.dislike_copy, size: 20,),
                                                SizedBox(width: 5,),
                                                Text(controller.allPost[index].negativeFeedback.toString()),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      // SizedBox(height: 5),

                                      
                                      SizedBox(height: 5),
                                      
                                      // [PRICE - STORE]
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Vio este producto a : ', style: TextStyle(fontSize: 14.0)),
                                              Text((controller.allPost[index].price).toString(), style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text('en: ', style: TextStyle(fontSize: 14.0)),
                                              Text(controller.allPost[index].store.name, style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold)),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 5),
                            
                                      Text(controller.allPost[index].comment, style: TextStyle(fontSize: 13.0)),
                                      SizedBox(height: 5),
                                      
                                      // [FEEDBACK]
                                      if(!controller.productFeedback.contains(controller.allPost[index].id))
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [

                                            // [POSITIVE BUTTON]
                                           ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color.fromARGB(255, 14, 110, 189), // Background color
                                                foregroundColor: Colors.white,    // Text and icon color
                                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                             ),
                                              onPressed: (){
                                                showModalBottomSheet(
                                                  context: context,
                                                  // shape: const RoundedRectangleBorder(
                                                  //   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                                  // ),
                                                  builder: (BuildContext context) {
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 250,
                                                      // padding: const EdgeInsets.all(16.0),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 20, right: 20),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                const Text(
                                                                  'Confirmas esta informacion?',
                                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                ),
                                                                const SizedBox(height: 10),
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    const Text('Fuiste testigo prescencial que la info publicada por este usuario es real y que el PRECIO / LOCAL son correctos.'),
                                                                    const SizedBox(height: 20),
                                                                    const Text('Tu votacion permitira actualizar el precio del producto en la publicacion original.'),
                                                                  ],
                                                                )
                                                                
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                            Column(
                                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [Padding(
                                                                padding: const EdgeInsets.only(bottom: 15),
                                                                child: Column(
                                                                  
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children: [
                                                                        ElevatedButton(
                                                                          onPressed: () {
                                                                            controller.handleFeedback('positive', controller.allPost[index]);
                                                                            Navigator.pop(context);
                                                                          }, // Closes the modal
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(10),
                                                                            child: const Text('Confirmo'),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),]
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                },
                                                );
                                              },
                                              child: Text('Confirmo este Dato',style: TextStyle(fontSize: 14),)
                                            ),
                                            
                                            // [NEGATIVE BUTTON]
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color.fromARGB(255, 194, 28, 16),     // Background color
                                                foregroundColor: Colors.white,    // Text and icon color
                                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                             ),
                                              onPressed: (){
                                                showModalBottomSheet(
                                                  context: context,
                                                  // shape: const RoundedRectangleBorder(
                                                  //   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                                  // ),
                                                  builder: (BuildContext context) {
                                                    return SizedBox(
                                                      width: double.infinity,
                                                      height: 250,
                                                      // padding: const EdgeInsets.all(16.0),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15, right: 20),
                                                        child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  
                                                                  const Text('Desmientes esta informacion?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                                                  const SizedBox(height: 10),
                            
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                  const Text('Verificaste presencialmente que esta infomacion entregada por el usuario no es real o bien esta desactualizada.'),
                                                                  const SizedBox(height: 20),
                                                                  const Text('Tu votacion permitira limpiar la aplicacion de datos falsos.'),
                            
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                              const Spacer(),
                                                              Column(
                                                                // crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Padding(
                                                                  padding: const EdgeInsets.only(bottom: 15),
                                                                  child: Column(
                                                                    
                                                                    children: [
                                                                      Column(
                                                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [
                                                                          ElevatedButton(
                                                                            onPressed: () { 
                                                                              controller.handleFeedback('negative', controller.allPost[index]);
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.all(10),
                                                                              child: const Text('Desmiento'),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),]
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                    
                                                    );
                                                },
                                                );
                                              },
                                               child: Text('Denunciar Dato',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                                            ),
                                            
                                            // Text('Responder', style: TextStyle(fontSize: 14.0))
                                          ],
                                      ),
                            
                                    ],
                                  )
                                )
                              ],
                            ),
                          ),
                        ),
                      
                        SizedBox(height: 10,)
                      ],
                    );
                  },    
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}