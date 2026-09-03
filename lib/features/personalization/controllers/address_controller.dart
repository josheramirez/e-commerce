import 'package:e_commerce/data/repositories/adress/address_repository.dart';
import 'package:e_commerce/features/personalization/models/address_model.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
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

  // Fetch All user Addresses
  Future<List<AddressModel>> getAllUserAddresses() async{
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere((address) => address.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Direccion no encontrada!', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async{
    try {

      Get.defaultDialog(
        title: '',
        onWillPop: () async {return false;},
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const CircularProgressIndicator()
      );

      // Clear the 'selected' field
      if(selectedAddress.value.id.isNotEmpty){
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }
      // Assign selected Address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the 'selected' field to true for the new selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);

    } catch (e) {
      Loaders.errorSnackBar(title: 'Error en Seleccion', message: e.toString());
    }
  }

  // Add new Address
  Future addNewAddress() async{
    try {
       // Start Loading
      FullScreenLoader.openLoadingDialog('Guardando Direccion', Images.loadingAnimation);
      
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
      Loaders.successSnackBar(title: "Felicitaciones", message: 'Tu direccion ha sido guardad.');

      // Refresh Addresses Data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();

    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Direccion no encontrada', message: e.toString());
    }
  }


  void resetFormFields(){ 
    name.clear();
    phoneNumber.clear(); 
    street.clear(); 
    city.clear(); 
    state.clear();
    postalCode.clear(); 
    country.clear();
    addressFormKey.currentState?.reset();
  }
}