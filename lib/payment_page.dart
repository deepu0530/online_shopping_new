// import 'package:flutter/material.dart';
// import 'package:online_shopping_app/cart_page.dart';
// import 'package:online_shopping_app/details_page.dart';
//
// class PaymentSelection extends StatefulWidget {
//   @override
//   _PaymentSelectionState createState() => _PaymentSelectionState();
// }
//
// class _PaymentSelectionState extends State<PaymentSelection> {
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
//                     height: 600,
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
//                                   Navigator.of(context).pop(
//                                     MaterialPageRoute(
//                                       builder: (context) =>ProductDetails (),
//                                     ),
//                                   );
//                                 }),
//                             Text(
//                               "Payment",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20),
//                             ),
//                             Image(image: AssetImage("assets/images/close.png"),height: 15,width: 15,color: Colors.orangeAccent,)
//                           ],
//                         ),
//                         Expanded(
//                           child: Container(
//                             //height: 150,
//                             padding: const EdgeInsets.only(right: 0),
//                             child: ListView.separated(
//                               scrollDirection: Axis.vertical,
//                               primary: false,
//                               itemCount: 10,
//                               // itemCount: listTodos.length,
//                               shrinkWrap: true,
//                               itemBuilder: (context, index) {
//                                 // PetsData todo = listTodos[index];
//                                 return CartList(
//                                   // name: todo.name,
//                                   // image: todo.image,
//                                   // breed: todo.breed,
//                                   // distance: "${todo.distance}",
//                                   // age: "${todo.age}",
//                                   // sex: "${todo.sex}",
//                                   // description: todo.description,
//                                 );
//                               },
//
//                               separatorBuilder: (context, index) {
//                                 return SizedBox(
//                                   height: 20,
//                                 );
//                               },
//                             ),
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
//                             "Subtotal",
//                             style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14),
//                           ),
//                           Text(
//                             "\$ 24.50",
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
//                             "Delivery",
//                             style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14),
//                           ),
//                           Text(
//                             "\$ 20",
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
//                         // onTap: (){
//                         //   Navigator.of(context).pop(
//                         //     MaterialPageRoute(
//                         //       builder: (context) =>MyCart (),
//                         //     ),
//                         //   );
//                         // },
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
//                               "Pay Now",
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
//       height: 50,
//       // width: 100,
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.grey[300],
//       ),
//       child: ListTile(
//         leading: Image(image: AssetImage("assets/images/close.png"),height: 20,width: 20,),
//         title:  Text(
//           "Total",
//           style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 16),
//         ),
//       ),
//     );
//   }
// }
//
