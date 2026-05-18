import 'package:e_commerce/common/widgets/commmo_shapes/containers/circular_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UChoiceChip extends StatelessWidget {
  const UChoiceChip({super.key, required this.text, required this.selected, this.onSelected});

final String text;
final bool selected;
final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(text), 
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected? UColors.white : null),
      avatar: const UCircularContainer(width: 50, height: 50, backgroundColor: Colors.green),
    );
  }
}