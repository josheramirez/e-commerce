import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class UTabBar extends StatelessWidget implements PreferredSizeWidget{
  const UTabBar({
    super.key, required this.tabs,
  });


  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: UColors.primary,
        unselectedLabelColor: UColors.darkGrey,
        labelColor: UColors.primary,
        tabAlignment: TabAlignment.start,
        tabs: tabs
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(UDeviceHelper.getAppBarHeight());
}
