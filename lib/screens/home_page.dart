import 'dart:convert';


import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:online_shopping_app/models/add_category_data.dart';
import 'package:online_shopping_app/models/category_data.dart';
import 'package:online_shopping_app/screens/details_page.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    this.name,
    this.boxposition,
  });

  final String name;
  final String boxposition;

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  final TextController = TextEditingController();
  dynamic res ;
AddCategory add = AddCategory();
  void addcategory()async{
    String  text = TextController.text.trim();
    // String filename=file.path.split("/").last;
    FormData data = FormData.fromMap({
      "name":text,
      //"image":await MultipartFile.fromFile(img.path)
      "message":text,
    });
    Response response =
    await Dio().post("http://aparna.pythonanywhere.com/category/" , data: data);
    setState(() {
      add = addCategoryFromJson(jsonEncode(response.data)) ;

      print(response.data);
      // res=response.statusMessage;
      // print(response);
    });
    var jsonData = json.decode(response.data);
    print(jsonData);
    if (response.statusCode > 200 &&
        response.statusCode < 250) {
      print("Sucess");
      await Dio();
      print("Registered");
    }
    else{
      print(jsonData);
    }
  }

  List<Categories> categoryList = List();

  //Product store = Product();
  List<Product> productList = List();

  String category = "";

  String indx = " ";
  String name = " ";

  //List<Categories> categories = List();

  bool _fetching = true;

  void getHttp() async {
    setState(() {
      _fetching = true;
    });
    try {
      Response response = await Dio().get(
          "http://aparna.pythonanywhere.com/categories/details");
      setState(() {
        categoryList = categoriesFromJson(jsonEncode(response.data));
        _fetching = false;
        //  productList = categoryList[0].products;
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F6FC),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Stack(
                    children: [
                      Container(
                        child: Icon(
                          Icons.notifications_rounded,
                          color: Color(0xFFF34647),
                          size: 25,
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 3,
                        child: Container(
                          child: Icon(
                            Icons.circle,
                            color: Color(0xFFECCA70),
                            size: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "What do you like to find",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          //   prefix: Icon(Icons.search,color: Colors.black,),
                          icon: Icon(
                            Icons.search,
                            color: Color(0xFFE2E3E7),
                            size: 25,
                          ),
                          hintText: "Search here...",
                          hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE2E3E7),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    //  padding: EdgeInsets.only(right: 20),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          // color: Color(0xFFFCAE59),
                          gradient: LinearGradient(
                              colors: [Colors.redAccent, Colors.orangeAccent])),
                      child:
                      // Center(child:
                      // Image(image:AssetImage("assets/images/align-center.png"),color: Colors.white,height: 20,width: 20,)
                      //   ,)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                            size: 20,
                          ),
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(20.0)),
                     // backgroundColor:  Color(0xFFF6D2D5),
                      title:Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Add Category",style: TextStyle(color: Colors.black,fontSize: 16),),
                              IconButton(
                                onPressed: (){ return showDialog(

                                  context: context,
                                  builder: (ctx) =>
                                      AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(20.0)),
                                        title: Text('Add Category'),

                                    content:  Container(
                                      height: 140,
                                      child: Column(
                                        children: [
                                          TextField(
                                             controller: TextController,
                                            decoration: InputDecoration(
                                                hintText: "Enter name"
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          RaisedButton(
                                              child: Text("Submit"),
                                              onPressed: (){
                                                 addcategory();
                                                setState(() {
                                                    res=res;
                                                });
                                              }),
                                           res == null ? Text("")  : Text("test --- ${res}"),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>FirstScreen (),
                                            ),
                                          );
                                        },
                                        child:  Text("Ok"),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text("Back"),
                                        //     Text("Ok"),
                                        //   ],
                                        // ),
                                      ),
                                    ],
                                  ),
                                );},icon: Icon(Icons.add,color: Colors.orangeAccent,size: 25,),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delete Category",style: TextStyle(color: Colors.black,fontSize: 16),
                              ),IconButton(
                                onPressed: (){ return showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Column(
                                      children: [
                                        Text("Alert Dialog Box"),
                                      ],
                                    ),
                                    content: Text("You have raised a Alert Dialog Box"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Text("okay"),
                                      ),
                                    ],
                                  ),
                                );},icon: Icon(Icons.delete_outline,color: Colors.orangeAccent,size: 25,),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Update Category",style: TextStyle(color: Colors.black,fontSize: 16),),
                              IconButton(
                                onPressed: (){ return showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Column(
                                      children: [
                                        Text("Alert Dialog Box"),
                                      ],
                                    ),
                                    content: Text("You have raised a Alert Dialog Box"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Text("okay"),
                                      ),
                                    ],
                                  ),
                                );},icon: Icon(Icons.update,color: Colors.orangeAccent,size: 25,),),
                            ],
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text("back",style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ),
                  );
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) =>AddCategory (),
                  //   ),
                  // );
                },icon: Icon(Icons.settings_outlined,color: Colors.orangeAccent,size:20,))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: categoryList.length > 0
                  ? ListView.separated(
                scrollDirection: Axis.horizontal,
                primary: false,
                itemCount: categoryList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Categories todo = categoryList[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        productList = categoryList[index].products;
                        indx = todo.categoryName;
                        print("$productList");
                      });
                    },
                    child: AllCategories(
                      name: categoryList[index].categoryName,
                      categoryimage: categoryList[index].image,
                      boxposition: indx,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 20,
                  );
                },
              )
                  : Container(
                // child: Center(
                //     child: CircularProgressIndicator(
                // strokeWidth: 4,color: Colors.orangeAccent,backgroundColor: Colors.redAccent,),
                //   ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended For You",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.orangeAccent,size:25,)),
                  // Text(
                  //   "Sell all",
                  //   style: TextStyle(
                  //       color: Colors.grey[400],
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold),
                  // )
                ],
              ),
            ),

            Expanded(
              child: Container(
                //height: 150,
                padding: const EdgeInsets.only(right: 20),
                child: categoryList.length > 0
                    ?
                InkWell(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    itemCount: productList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListOfProducts(
                        productname: productList[index].productName,
                        productimage: productList[index].image,
                        productprice: productList[index].productPrice,
                        productdescription: productList[index].productDescription,
                        productrating: productList[index].rating,
                        nm: name,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                  ),
                )
                    : Container( child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    color: Colors.orangeAccent,
                    backgroundColor: Colors.redAccent,
                  ),
                ),),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class AllCategories extends StatefulWidget {
  const AllCategories({
    this.name,
    this.boxposition,
    this.categoryimage,
  });

  final String name;
  final String categoryimage;
  final String boxposition;

  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: widget.boxposition == widget.name
          ? BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFF6D2D5))
          : BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFFCFBFF),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "http://aparna.pythonanywhere.com/${widget.categoryimage}"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.name,
              style: TextStyle(
                  color: widget.boxposition == widget.name
                      ? Colors.white
                      : Colors.grey[700],
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ListOfProducts extends StatefulWidget {
  const ListOfProducts(
      {this.productname,
        this.productprice,
        this.nm,
        this.productimage,
        this.products,
        this.productdescription,
        this.productrating});

  final String productname;
  final double productprice;
  final String nm;
  final String productimage;
  final Product products;
  final String productdescription;
  final double productrating;

  @override
  _ListOfProductsState createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  bool liked = false;

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        name: widget.productname,image: widget.productimage,price: widget.productprice,description: widget.productdescription,
                        rating: widget.productrating,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                  height: 140,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    // image: DecorationImage(
                    //   image: NetworkImage(
                    //       "http://aparna.pythonanywhere.com/${widget.productimage}"),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child:  Image(image: NetworkImage("http://aparna.pythonanywhere.com/${widget.productimage}"),fit: BoxFit.cover,height: 160,width: 130,),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 20,right: 20,bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productname,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Row(
                              children: [
                                Icon(Icons.lock_clock,size: 15,color: Colors.grey[400],),
                                Text("  20-30 min",style: TextStyle(color: Colors.grey[400],fontSize: 12,fontWeight: FontWeight.bold),),
                              ],
                            ),

                            Row(
                              children: [
                                Icon(Icons.star_outline_sharp,size: 20,color: Colors.yellow,),
                                Text(" ${widget.productrating}",style: TextStyle(color: Colors.grey[700],fontSize: 12,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ]

                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(
                            "33 Calories",
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '\$', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green
                                    ,fontSize: 14)),
                                TextSpan(
                                    text: ' ${widget.productprice}',
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 5,
          child: Container(
              child: IconButton(
                icon: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  size: 25,
                  color: liked ? Colors.red : Colors.grey,
                ),
                onPressed: () => _pressed(),
              )
          ),
        ),
      ],
    );
  }
}

// class PopularItems extends StatefulWidget {
//   const PopularItems({this.name, this.image, this.price, this.nm});
//
//   final String name;
//   final String image;
//   final int price;
//   final String nm;
//
//   @override
//   _PopularItemsState createState() => _PopularItemsState();
// }
//
// class _PopularItemsState extends State<PopularItems> {
//   bool liked = false;
//
//   _pressed() {
//     setState(() {
//       liked = !liked;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 160,
//         decoration: BoxDecoration(
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white,
//         ),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 150,
//                   width: 160,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10.0),
//                         topRight: Radius.circular(10.0)),
//                     // color: Colors.grey[300],
//                     // image: DecorationImage(
//                     //   image: NetworkImage(widget.image),
//                     // )
//                   ),
//                   //color: Colors.grey[300],
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                       child: IconButton(
//                         icon: Icon(
//                           liked ? Icons.favorite : Icons.favorite_border,
//                           size: 25,
//                           color: liked ? Color(0xFFF17E69) : Color(0xFFF17E69),
//                         ),
//                         onPressed: () => _pressed(),
//                       )),
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.name,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.local_fire_department_outlined,
//                         color: Colors.deepOrange,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         "33 Calories",
//                         style: TextStyle(
//                             color: Colors.grey[300],
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         height: 20,
//                         width: 40,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.rectangle,
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.orangeAccent[200]),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         "${widget.price}",
//                         style: TextStyle(
//                             color: Colors.grey[400],
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         )
//       // Row(
//       //   children: [
//       //     Text("Fruits",style: TextStyle(
//       //       color: Colors.black,
//       //       fontSize: 12,
//       //     ),)
//       //   ],
//       // ),
//     );
//   }
// }
