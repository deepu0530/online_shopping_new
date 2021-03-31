// import 'package:flutter/material.dart';
//
// class SecondScreen extends StatefulWidget {
//   @override
//   _SecondScreenState createState() => _SecondScreenState();
// }
//
// class _SecondScreenState extends State<SecondScreen> {
//
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
//       if (_n != 0)
//         _n--;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  new Container(
//       child: new Center(
//         child: new Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             new FloatingActionButton(
//               onPressed: add,
//               child: new Icon(Icons.add, color: Colors.black,),
//               backgroundColor: Colors.white,),
//
//             new Text('$_n',
//                 style: new TextStyle(fontSize: 60.0)),
//
//             new FloatingActionButton(
//               onPressed: minus,
//               child: new Icon(
//                   const IconData(0xe15b, fontFamily: 'MaterialIcons'),
//                   color: Colors.black),
//               backgroundColor: Colors.white,),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_app/models/product_details_data.dart';
import 'package:online_shopping_app/screens/home_page.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({this.name,this.image,this.price,this.description,this.categoryName,this.rating});
  final String name;
  final String image;
  final double price;
  final String description;
  final String categoryName;
  final double rating;
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool _fetching = true;
  Categories categoryDetails = Categories();
  List<Product>productDetails = List();
  void getHttp() async {
    setState(() {
      _fetching = true;
    });
    try {
      Response response =
      await Dio().get("http://aparna.pythonanywhere.com/products/?product_id=${widget.name}");
      setState(() {
        categoryDetails = categoriesFromJson(jsonEncode(response.data)) ;
        productDetails=categoryDetails.products;
        print(response);
      });
      print(response);
    } catch (e) {
      setState(() {
        _fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }
  int _n = 0;
  int one = 10;
  int two =10;

  void add() {
    setState(() {
      _n++;
      //_m+460;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
      //if (_m != 0) _m-460;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF6F5FB),
      body: Stack(
        children: [
          Container(

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop(
                            MaterialPageRoute(
                              builder: (context) =>FirstScreen (),
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.card_travel,
                          color:Color(0xFFF96461),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 280,
                    width: 500,
                    child: Image(image: NetworkImage("http://aparna.pythonanywhere.com/${widget.image}"),fit: BoxFit.cover,)
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                   // "${listTodos.name}",
                    //"Orange",
                    widget.name,
             // widget.name,
                   // widget.productname,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                   // text: 'Default',
                   // style: TextStyle(color: Colors.red), /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                          text: '\$', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 12)),
                      TextSpan(

                         // text: '$_m',
                          text: " ${widget.price}",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                      // TextSpan(
                      //     text: '/kg',
                      //     style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 12,)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //listTodos == null?Container():
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                height: 350,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.local_fire_department_outlined,
                                color: Color(0xFFE37844),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "33 Calories",
                                //widget.description,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_outline_sharp,size: 20,color: Colors.yellow,),
                              RichText(
                                text: TextSpan(
                                  // text: 'Default',
                                  // style: TextStyle(color: Colors.red), /*defining default style is optional */
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' ${widget.rating}', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14)),
                                    TextSpan(
                                        text: '  (2645 reviews)',
                                        style: TextStyle(color: Colors.grey[700],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),

                                  ],
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        widget.description,
                       //listTodos.description,
                       // "4.9(2645 reviews)ldvgdibcgdvbxc gfiuvvvvvcb cxbhc 4.9(2645 reviews)ldvgdibcgdvbxc gfiuvvvvvcb cxbhc",
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                           // fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Quantity",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: minus,
                                    child: Container(
                                      height: 22,
                                      width: 22,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFDE575E),
                                      ),
                                      child: Icon(
                                        Icons.minimize,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('$_n',
                                      style: new TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black)),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: add,
                                    child: Container(
                                      height: 22,
                                      width: 22,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFDE575E),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery time",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.lock_clock,size: 20,),
                                  SizedBox(width: 5,),
                                  Text(
                                    "20-30 min",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      InkWell(
                        // onTap: (){
                        //   Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //       builder: (context) =>MyCart (),
                        //     ),
                        //   );
                        // },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFFEA440),
                            boxShadow: [BoxShadow(
                              offset: Offset(0,3),
spreadRadius: 1,
                              blurRadius: 15,
                              color: Color(0xFFEFDAC5),
                            )]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.card_travel,
                                color: Colors.deepOrange,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                "Add to Cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
