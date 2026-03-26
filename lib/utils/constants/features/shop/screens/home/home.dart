import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/primary_header_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UPrimaryHeaderContainer(
        child: Column(
          children: [
            UAppBar(
              title: Column(
                children: [
                  Text(
                    "Good Morning",
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: UColors.buttonPrimary,
                    ),
                  ),
                  Text(
                    "Good Morning",
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.apply(color: UColors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
