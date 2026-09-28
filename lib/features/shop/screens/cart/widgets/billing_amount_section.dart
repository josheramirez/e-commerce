import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;

final chileanPesoFormat = NumberFormat.currency(
  locale: 'es_CL',
  symbol: ' ', // or 'CLP\$'
  decimalDigits: 0, // CLP typically doesn't use cents
);


    return Column(
      children: [

        // SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${chileanPesoFormat.format(subTotal)}', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2),

        // Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Costo Envio', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${chileanPesoFormat.format(int.parse(PricingCalculator.calculateShippingCost(subTotal, 'CL')))}', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2),
        
        // Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Impuesto Adicionales', style: Theme.of(context).textTheme.bodyMedium),
             Text('\$${chileanPesoFormat.format(int.parse(PricingCalculator.calculateTax(subTotal, 'CL')))}', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2),

        // Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: Theme.of(context).textTheme.bodyMedium),
             Text('\$${chileanPesoFormat.format(PricingCalculator.calculateTotalPrice(subTotal, 'CL'))}', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2),
      ],
    );
  }
}