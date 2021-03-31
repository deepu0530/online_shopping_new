// import 'package:flutter/material.dart';
// import 'package:online_shopping_app/details_page.dart';
// import 'package:online_shopping_app/payment_page.dart';
//
// class MyCart extends StatefulWidget {
//   @override
//   _MyCartState createState() => _MyCartState();
// }
//
// class _MyCartState extends State<MyCart> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             //padding: EdgeInsets.only(top: 50, left: 20, right: 20),
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: Container(
//                     padding: EdgeInsets.only(top: 40, left: 20, right: 20,),
//                     height: 650,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       borderRadius: BorderRadius.only(
//                           bottomRight: Radius.circular(30),
//                           bottomLeft: Radius.circular(30)),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             IconButton(
//                                 icon: Icon(
//                                   Icons.arrow_back_ios_rounded,
//                                   color: Colors.orangeAccent,
//                                 ),
//                                 onPressed: () {
//                                   // Navigator.of(context).pop(
//                                   //   MaterialPageRoute(
//                                   //     builder: (context) =>ProductDetails (),
//                                   //   ),
//                                   // );
//                                 }),
//                             Text(
//                               "My Cart",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20),
//                             ),
//                            Image(image: AssetImage("assets/images/close.png"),height: 15,width: 15,color: Colors.orangeAccent,)
//                           ],
//                         ),
//                         Expanded(
//                           child: Container(
//                             //height: 150,
//                             padding: const EdgeInsets.only(right: 0),
//                               child: ListView.separated(
//                                 scrollDirection: Axis.vertical,
//                                 primary: false,
//                                 itemCount: 10,
//                                 // itemCount: listTodos.length,
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) {
//                                   // PetsData todo = listTodos[index];
//                                   return CartList(
//                                     // name: todo.name,
//                                     // image: todo.image,
//                                     // breed: todo.breed,
//                                     // distance: "${todo.distance}",
//                                     // age: "${todo.age}",
//                                     // sex: "${todo.sex}",
//                                     // description: todo.description,
//                                   );
//                                 },
//
//                                 separatorBuilder: (context, index) {
//                                   return SizedBox(
//                                     height: 20,
//                                   );
//                                 },
//                               ),
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 30,right: 20,left: 20),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Item Select",
//                             style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14),
//                           ),
//                           Text(
//                             "3",
//                             style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Total",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16),
//                           ),
//                           Text(
//                             "\$ 264.50",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 30,),
//                       InkWell(
//                         onTap: (){
//                           // Navigator.of(context).push(
//                           //   MaterialPageRoute(
//                           //     builder: (context) =>PaymentSelection (),
//                           //   ),
//                           // );
//                         },
//                         child: Container(
//                           height: 50,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.orangeAccent,
//                               boxShadow: [BoxShadow(
//                                 offset: Offset(0,7),
//
//                                 blurRadius: 1,
//                                 color: Colors.orangeAccent,
//                               )]
//                           ),
//                           child:Center(
//                             child: Text(
//                               "Order Now",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class CartList extends StatefulWidget {
//   @override
//   _CartListState createState() => _CartListState();
// }
//
// class _CartListState extends State<CartList> {
//   int _n = 0;
//
//   void add() {
//     setState(() {
//       _n++;
//     });
//   }
//
//   void minus() {
//     setState(() {
//       if (_n != 0) _n--;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 130,
//       // width: 100,
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.grey[300],
//       ),
//       child: Row(
//         children: [
//           Container(
//             height: 150,
//             width: 200,
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.grey[300],
//             ),
//           ),
//           // Text("Fruits",style: TextStyle(
//           //   color: Colors.black,
//           //   fontSize: 12,
//           // ),)
//           Padding(
//             padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Fresh Orange",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       height: 20,
//                       width: 40,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.orangeAccent[200]),
//                       child: Center(child: Text("1 kg",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       "\$ 4.60",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     InkWell(
//                       onTap: minus,
//                       child: Container(
//                         height: 20,
//                         width: 20,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.orangeAccent,
//                         ),
//                         child: Icon(
//                           Icons.minimize,
//                           color: Colors.white,
//                           size: 12,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Text('$_n kg',
//                         style: new TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black)),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     InkWell(
//                       onTap: add,
//                       child: Container(
//                         height: 20,
//                         width: 20,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.orangeAccent,
//                         ),
//                         child: Icon(
//                           Icons.add,
//                           color: Colors.white,
//                           size: 12,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
