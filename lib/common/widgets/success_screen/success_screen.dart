import 'dart:io';

import 'package:e_commerce/common/style/spacing_styles.dart';
import 'package:e_commerce/data/services/MailUtil.dart';
import 'package:e_commerce/data/services/WhatsAppUtil.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';


class SuccessScreen extends StatelessWidget {
  final String image, title, subtitle;
  final VoidCallback onPress;
  final String? order;
  
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPress, 
    this.order,
  });

  @override
  Widget build(BuildContext context) {
    print('order : $order');

    
    String message = "Hola, hice esta orden: ${order.toString()}";
    String phoneNumber = "+56964117545";
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight * 1,
          child: Column(
            children: [
              /// Image
              Image(image: AssetImage(image),
                width: HelperFunctions.screenWidth() * 0.5,),
              const SizedBox(height: USizes.spaceBtwSections,),

              /// Title % Subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: USizes.spaceBtwItems,),

              if(order!.isNotEmpty)
               Text(order!, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              if(order!.isNotEmpty)
              const SizedBox(height: USizes.spaceBtwItems,),
              Text(subtitle, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: USizes.spaceBtwSections,),

// [WHATSAPP]
SizedBox(
  width: 160,
  height: 60,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green, // Sets the background (fill) color
      // foregroundColor: Colors.white, // Sets the text and icon color
      side: const BorderSide(
        color: Colors.white,         // Sets the border color
        width: 2.0,                // Sets the border width
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
    ),
    onPressed: () => WhatApputil.openWhatsApp(
      phoneNumber: phoneNumber,
      message: message,
    ),
    child: const Text('Enviar Whatsapp')
  ),
),
const SizedBox(height: USizes.spaceBtwSections/2),


// [GMAIL]
SizedBox(
  width: 160,
  height: 60,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red, // Sets the background (fill) color
      // foregroundColor: Colors.white, // Sets the text and icon color
      side: const BorderSide(
        color: Colors.white,         // Sets the border color
        width: 2.0,                // Sets the border width
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
    ),
    onPressed: () => Mailutil.sendEmail(),
    child: const Text('Enviar Mail')
  ),
),
const SizedBox(height: USizes.spaceBtwSections/2),


              /// Buttons
              SizedBox(
                width: 160,
                height: 60,
                child: 
                  ElevatedButton(
                    onPressed: onPress,
                    child: const Text('Ir a Menu')
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}