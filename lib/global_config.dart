import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GlobalConfig extends GetxController {
  static GlobalConfig get instance => Get.find();
  
  final localData = true.obs;

}