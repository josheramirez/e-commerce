import 'package:flutter/material.dart';

class HelperFunctions {
  static Color? getColor(String value){
    if(value=='Green'){
      return Colors.green;
    }else if( value == 'Green'){
      return Colors.green;
    }else if( value == 'Blue'){
      return Colors.blue;
    }else if( value == 'Yellow'){
      return Colors.yellow;
    }else{
      return null;
    }
    
  }


// static bool isDarkMode(BuildContext){
//   return Theme.of(context).brightness == Brightness.dark;
// }

}