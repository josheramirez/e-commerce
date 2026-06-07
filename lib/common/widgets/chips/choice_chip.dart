import 'package:e_commerce/common/widgets/commmo_shapes/containers/circular_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UChoiceChip extends StatelessWidget {
  const UChoiceChip({super.key, required this.text, required this.selected, this.onSelected});

final String text;
final bool selected;
final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    bool isColor = HelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ?  SizedBox() :  Text(text), 
        selected: selected,
        onSelected: onSelected,
        selectedColor: Colors.blue, 
        backgroundColor: Colors.grey[200], 
          labelStyle: TextStyle(
      color: selected ? Colors.white : Colors.black,
        ),
        checkmarkColor: Colors.white, 
        // labelStyle: TextStyle( color: selected ? UColors.white: null),
        shape: isColor ? CircleBorder() : null,
        padding: isColor ?  EdgeInsets.zero : null,
        avatar: isColor ? UCircularContainer(width: 50, height: 50, backgroundColor: HelperFunctions.getColor(text)!) : null,
        labelPadding: isColor ? EdgeInsets.zero : null,
        // backgroundColor:  isColor ? HelperFunctions.getColor(text) : null,
      ),
    );
  }
}