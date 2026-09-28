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
  const ProductMarketScreen ({super.key});


  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ProductMarketController());
    final products = controller.products;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.all(0),
            child:  
              

             Obx(
               ()=> ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      print(product.toJson());
                      return  
                   
                        Container(
                          height: 75,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              // IMAGE
                              Container(
                                color: Colors.red,
                                child: 
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: SizedBox(
                                    height: 80, 
                                    width: 80,
                                    child: Image(image: AssetImage(product.image) as ImageProvider ,fit: BoxFit.contain),
                                  ),
                                ),
                              ),
                              
                              // 
               
                              // [NAME - PRICE]
                              Container(
                                color: Colors.green,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(product.name),
                                  Text(product.quantity),
                                  Text('\$${product.price.toString()}', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
               
                                  ],
                                ),
                              ),
                              // SizedBox(width: 20),
               
                              // [STORE]
                              Container(
                                color: Colors.blueAccent,
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Buscalo en:', style: TextStyle(fontSize: 10.0)),
                                    Text(product.store!.name.toUpperCase(), style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                                    Text('Actualizado el: ', style: TextStyle(fontSize: 10.0)),
                                    Text( DateFormat("EEEE, d MMM", "es").format(DateTime.now())),
                                  ],
                                ),
                              ),
                              // // SizedBox(width: 20),
               
                              // [POST INFO]
                              Container(
                                color: Colors.amber,
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Feedback
                                    Row(
                                      children: [
                                        Icon(Iconsax.like_1_copy, size: 22),
                                        SizedBox(width: 5,),
                                        Text(product.post!.positiveFeedback.toString()),
                                        SizedBox(width: 15,),
                                        Icon(Iconsax.dislike_copy, size: 22),
                                        SizedBox(width: 5,),
                                        Text(product.post!.negativeFeedback.toString()),
                                      ],
                                    ),
                                    // Comments
                                    Row(
                                      children: [
                                        Text('Comentarios :'),
                                        Text(product.commentSize.toString()),
                                      ],
                                    ),
               
                                    SizedBox(
                                      // width: 100,
                                      // height: 40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(120, 30), 
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0) ,// Size(width, height)
                                        ),
                                        onPressed: () => Get.to(() => CommentScreen( product: product))?.then((value) {
                                          // Call your refresh method or rebuild the UI
                                          print('come back babt');
                                          // Or setState(() {}) if using a StatefulWidget
                                        }),
                                        child:  Text('Comentar', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                                      ),
                                    ),
               
                                  ],
                                ),
                              )
                            ],
                          )
               
                        );
                    },
                    separatorBuilder: (context, index) {
                      // For vertical lists, use height. For horizontal lists, use width.
                      return const SizedBox(height: 5); 
                    },
                ),
             )
          
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