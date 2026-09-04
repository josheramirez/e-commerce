import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce/features/shop/controllers/product/order_controller.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class OrdersListItems extends StatelessWidget {
  const OrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = HelperFunctions.isDarkMode(context);


    return FutureBuilder(
      future: controller.fetchUserOrders(), 
      builder: (_, snapshot){
        
        // Nothing Found Widget
        final empty = AnimationLoaderWidget(
          text: 'Whops, No tienes Pedidos',
          animation: Images.orderCompleteAnimation,
          showAction: true,
          actionText: 'Haz un Pedido Aqui',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (snapshot.connectionState == ConnectionState.waiting) {return empty;}
        // if (snapshot.connectionState == ConnectionState.waiting) {return loader;}
        if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Hay Datos'));
        }
        if (snapshot.hasError) return const Center(child: Text('Hubo un error.'));
    
        final orders = snapshot.data!;

        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, index) => SizedBox(height: USizes.spaceBtwItems),
          itemBuilder: (_, index){
            final order = orders[index];

            return URoundedContainer(
              showBorder: true,
              padding: EdgeInsets.all(USizes.md),
              backgroundColor: dark ? UColors.dark : UColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // [Order Status]
                  Row(
                    children: [
                      Icon(Iconsax.ship_copy),
                      SizedBox(width: USizes.spaceBtwItems / 2),
            
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderStatusText,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge!.apply(color: UColors.primary, fontWeightDelta: 1)),
                            Text(order.formattedOrderDate, style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      ),
            
                      // Icon
                      IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_3_copy, size: USizes.iconSm)),
                    ],
                  ),
                  SizedBox(height: USizes.spaceBtwItems),
            
                  // [Order Details]
                  Row(
                    children: [
                      
                      // [Ordedr Number]
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Iconsax.tag_copy),
                            SizedBox(width: USizes.spaceBtwItems / 2),

                            Flexible(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Order',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.labelMedium),
                                      Text(order.id,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis, 
                                        style: Theme.of(context).textTheme.titleMedium),
                                    ],
                              )
                            )
                          ],
                        )
                      ),
            
                      // [Delivery Date]
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Iconsax.calendar_copy),
                            SizedBox(width: USizes.spaceBtwItems / 2),

                            Expanded(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Fecha Entrega',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.labelMedium),
                                      Text(order.formattedDeliveryDate,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.titleMedium),
                                    ],
                              )
                            )
                          ],
                        )
                      )
                    ],
                  ),
                ],
              ),
            );
          }
        );
      }
    );
  }
}