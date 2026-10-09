import 'package:e_commerce/dummy_data.dart';
import 'package:e_commerce/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce/features/shop/controllers/product_market/product_market_controller.dart';
import 'package:e_commerce/features/shop/models/product_market_model.dart';
import 'package:e_commerce/features/shop/screens/comments/comment_screen.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';

class ProductMarketScreen extends StatelessWidget {
  const ProductMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductMarketController());
    final products = controller.products;

    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 210, 210),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Obx(
              () => ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  // print(product.toJson());
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // default white
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // default 16, which is card radius large
                      border: Border.all(
                        color: Colors.black,
                      ), // white color default
                    ),
                    height: 85,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          // IMAGE
                          Container(
                            // color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: SizedBox(
                                // height: 80,
                                width: 80,
                                child: Image(
                                  image:
                                      AssetImage(product.image)
                                          as ImageProvider,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),

                          //

                          // [NAME - PRICE]
                          Container(
                            width: 75,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(
                                    alpha: 0.1,
                                  ), // Shadow color
                                  blurRadius: 3, // Softness of the shadow
                                  spreadRadius:
                                      -2, // Shrinks shadow to hide top/left bleed
                                  offset: const Offset(
                                    6,
                                    6,
                                  ), // Moves shadow 6px right and 6px down
                                ),
                              ],
                            ),
                            // color: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  capitalize(product.name.toLowerCase()),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1, // Limits text to a single line
                                  overflow: TextOverflow.ellipsis, 
                                ),
                                Text(
                                  product.quantity,
                                  style: TextStyle(fontSize: 13.0),
                                ),
                                Text(
                                  '\$${product.post?.price.toString()}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(width: 20),

                          // [STORE]
                          Container(
                            width: 95,
                            decoration: BoxDecoration(
                              color: Colors.white, // Container background color
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(
                                    alpha: 0.1,
                                  ), // Shadow color
                                  blurRadius: 5, // Softness of the shadow
                                  spreadRadius:
                                      -2, // Shrinks shadow to hide top/left bleed
                                  offset: const Offset(
                                    6,
                                    6,
                                  ), // Moves shadow 6px right and 6px down
                                ),
                              ],
                            ),
                            // color: Colors.blueAccent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'buscalo en:',
                                  style: TextStyle(fontSize: 13.0),
                                ),
                                Text(
                                  product.post!.store.name.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'actualizado el: ',
                                  style: TextStyle(fontSize: 13.0),
                                ),
                                Text(
                                  DateFormat(
                                    "EEEE, d MMM",
                                    "es",
                                  ).format(DateTime.now()),
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // // SizedBox(width: 20),

                          // [POST INFO]
                          Container(
                            width: 110,
                            // color: Colors.amber,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // [FEEDBACK]
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Iconsax.like_1_copy, size: 22),
                                    SizedBox(width: 5),
                                    Text(
                                      product.post!.positiveFeedback.toString(),
                                    ),
                                    SizedBox(width: 15),
                                    Icon(Iconsax.dislike_copy, size: 22),
                                    SizedBox(width: 5),
                                    Text(
                                      product.post!.negativeFeedback.toString(),
                                    ),
                                  ],
                                ),

                                // [COMMENTS]
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Comentarios :',
                                      style: TextStyle(fontSize: 13.0),
                                    ),
                                    Text(
                                      product.commentSize.toString(),
                                      style: TextStyle(fontSize: 13.0),
                                    ),
                                  ],
                                ),

                                // [BUTTON]
                                Container(
                                  // color: Colors.red,
                                  width: 120,
                                  height: 30,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.indigo,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.0,
                                        ),
                                        side: const BorderSide(
                                          color: Colors.blueGrey,
                                          width: 1.5,
                                        ), // Change your radius here
                                      ),
                                      // fixedSize: const Size(120, 30),
                                      // padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0) ,// Size(width, height)
                                      minimumSize: const Size(120, 30),

                                      // 2. Reduce the padding inside the button
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),

                                      // 3. Optional: shrink text to fit the smaller button
                                      textStyle: const TextStyle(fontSize: 13),
                                    ),
                                    onPressed: () =>
                                        Get.to(
                                          () => CommentScreen(product: product),
                                        )?.then((value) {
                                          // Call your refresh method or rebuild the UI
                                          print('come back babt');
                                          // Or setState(() {}) if using a StatefulWidget
                                        }),
                                    child: Text(
                                      'Comentar',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  // For vertical lists, use height. For horizontal lists, use width.
                  return const SizedBox(height: 5);
                },
              ),
            ),
          ),
        ),
      ),
    );

    // FutureBuilder(

    //     future: controller.getAllMarketProduct(),
    //     builder: (context, snapshot){
    //       if (snapshot.hasError) {
    //         return Text('Error: ${snapshot.error}');
    //       }
    //       final products = snapshot.data!;

    //       return ListView.builder(
    //         shrinkWrap: true,
    //         itemCount: products.length,
    //         itemBuilder: (_, index) => Text(products[index].name)
    //       );
    //     }
    //   )

    // FutureBuilder(
    //   future: controller.getAllMarketProduct(),
    //   builder: (context, snapshot){

    //     if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}');
    //     }
    //     final products = snapshot.data!;

    //     print(products.length);

    //     return ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: products.length,
    //     itemBuilder: (_, index) =>
    //     // Text(products[index].name)
    //       Container(
    //         height: 75,
    //         child:
    //           Row(
    //       //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             // mainAxisSize: MainAxisSize.max,
    //             children: [
    //               Container(
    //                 color: Colors.red,
    //                 child:
    //                   Padding(
    //                     padding: const EdgeInsets.all(1.0),
    //                     child: SizedBox(
    //                       height: 80,
    //                       width: 80,
    //                       child: Image(image: AssetImage(products[index].image) as ImageProvider ,fit: BoxFit.contain),
    //                     ),
    //                   ),
    //               ),
    //               Container(
    //                 color: Colors.green,
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(products[index].name),
    //                     Text(products[index].quantity),
    //                     Text('\$${products[index].price.toString()}', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),

    //                   ],
    //                 ),
    //               ),
    //         // SizedBox(width: 20),
    //         Container(
    //           color: Colors.blueAccent,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text('Buscalo en:', style: TextStyle(fontSize: 10.0)),
    //               Text(products[index].store!.name.toUpperCase(), style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
    //               Text('Actualizado el: ', style: TextStyle(fontSize: 10.0)),
    //               Text(products[index].updateDate.toString()),
    //             ],
    //           ),
    //         ),
    //         // // SizedBox(width: 20),
    //         Container(
    //           color: Colors.amber,
    //           child: Column(
    //             // crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               // Feedback
    //               Row(
    //                 children: [
    //                   Icon(Iconsax.like_1_copy, size: 22),
    //                   SizedBox(width: 5,),
    //                   Text('100'),
    //                   SizedBox(width: 15,),
    //                   Icon(Iconsax.dislike_copy, size: 22),
    //                   SizedBox(width: 5,),
    //                   Text('20'),
    //                 ],
    //               ),
    //               // Comments
    //               Row(
    //                 children: [
    //                   Text('Comentarios :'),
    //                   Text('1k'),
    //                 ],
    //               ),

    //               SizedBox(
    //                   // width: 100,
    //                   // height: 40,
    //                   child: ElevatedButton(
    //                     style: ElevatedButton.styleFrom(
    //                       fixedSize: const Size(120, 30),
    //                       padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0) ,// Size(width, height)
    //                     ),
    //                     onPressed: () => Get.to(() => CommentScreen( product: products[index])),
    //                     child:  Text('Comentar', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
    //                   ),
    //                 ),

    //             ],
    //           ),
    //         )
    //                 ],
    //               )

    //           ),
    //     );
    //   }
    // )
  }
}
