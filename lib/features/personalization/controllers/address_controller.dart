import 'package:e_commerce/data/repositories/adress/address_repository.dart';
import 'package:e_commerce/dummy_data.dart';
import 'package:e_commerce/features/personalization/models/address_model.dart';
import 'package:e_commerce/features/personalization/screens/address/add_new_address.dart';
import 'package:e_commerce/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final addressRepository = Get.put(AddressRepository());
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  late Future<List<AddressModel>> myFuture;

  final localData = true;
  final RxList<AddressModel> allAddresses = <AddressModel>[].obs;

  @override
  void onInit() {
    myFuture = getAllUserAddresses();
    super.onInit();
  }

  // Fetch All user Addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    // Fetch Local data or From Firebase
    if (localData) {
      try {
        final addresses = DummyData.addresses;
        selectedAddress.value = addresses.firstWhere(
          (address) => address.selectedAddress,
          orElse: () => AddressModel.empty(),
        );
        // print('selected : ${selectedAddress.toJson()}');
        allAddresses.assignAll(addresses);
        return addresses;
      } catch (e) {
        return [];
      }
    } else {
      try {
        final addresses = await addressRepository.fetchUserAddress();
        selectedAddress.value = addresses.firstWhere(
          (address) => address.selectedAddress,
          orElse: () => AddressModel.empty(),
        );
        return addresses;
      } catch (e) {
        Loaders.errorSnackBar(
          title: 'Direccion no encontrada!',
          message: e.toString(),
        );
        return [];
      }
    }
  }

  Future<void> selectAddress(AddressModel newSelectedAddress) async {
    if (localData) {
      try {
        //  Get.defaultDialog(
        //   title: '',
        //   onWillPop: () async {return false;},
        //   barrierDismissible: false,
        //   backgroundColor: Colors.transparent,
        //   content: const CircularProgressIndicator()
        // );

        // Clear the 'selected' field
        if (selectedAddress.value.id.isNotEmpty) {
          final oldAddress = allAddresses.firstWhere(
            (address) => address.id == selectedAddress.value.id,
          );
          final newAddress = oldAddress.copyWith(selectedAddress: false);
          final postIndex = allAddresses.indexWhere(
            (address) => address.id == selectedAddress.value.id,
          );
          allAddresses[postIndex] = newAddress;
        }

        allAddresses.forEach((address) => print(address.toJson()));

        // // Assign selected Address
        newSelectedAddress.selectedAddress = true;
        selectedAddress.value = newSelectedAddress;

        final postIndexNewAdress = allAddresses.indexWhere(
          (address) => address.id == selectedAddress.value.id,
        );
        allAddresses[postIndexNewAdress] = newSelectedAddress;

        // // Set the 'selected' field to true for the new selected address
        // await addressRepository.updateSelectedField(selectedAddress.value.id, true);
      } catch (e) {
        Loaders.errorSnackBar(
          title: 'Error en Seleccion',
          message: e.toString(),
        );
      }
    } else {
      try {
        Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const CircularProgressIndicator(),
        );

        // Clear the 'selected' field
        if (selectedAddress.value.id.isNotEmpty) {
          await addressRepository.updateSelectedField(
            selectedAddress.value.id,
            false,
          );
        }

        // Assign selected Address
        newSelectedAddress.selectedAddress = true;
        selectedAddress.value = newSelectedAddress;

        // Set the 'selected' field to true for the new selected address
        await addressRepository.updateSelectedField(
          selectedAddress.value.id,
          true,
        );
      } catch (e) {
        Loaders.errorSnackBar(
          title: 'Error en Seleccion',
          message: e.toString(),
        );
      }
    }
  }

  // Add new Address
  Future addNewAddress() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
        'Guardando Direccion',
        Images.loadingAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );

      final id = await addressRepository.addAddress(address);

      // Update Selected Address status
      address.id = id;
      await selectAddress(address);

      // Remove Loader
      FullScreenLoader.stopLoading();

      // Show Success Message
      Loaders.successSnackBar(
        title: "Felicitaciones",
        message: 'Tu direccion ha sido guardad.',
      );

      // Refresh Addresses Data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(
        title: 'Direccion no encontrada',
        message: e.toString(),
      );
    }
  }

  // Reset all values
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    city.clear();
    state.clear();
    postalCode.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  // Show Addresses ModalBottomSheet at Checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(USizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(
                title: 'Seleccionar Direccion',
                showActionButton: false,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              FutureBuilder(
                future: getAllUserAddresses(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return const Center(child: Text('No Hay Datos'));
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('Hubo un error.'));
                  }

                  final addresses = snapshot.data!;

                  return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: USizes.spaceBtwItems),
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) => SingleAddress(
                      address: addresses[index],
                      onTap: () async {
                        selectedAddress(addresses[index]);
                        Get.back();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: USizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => AddNewAddressScreen()),
                  child: const Text('Agregar nueva direccion'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
