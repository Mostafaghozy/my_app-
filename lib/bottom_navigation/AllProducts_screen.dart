//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
import 'package:first_app/dio/api_provider.dart';
import 'package:first_app/dio/model/products_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllproductsScreenScreen extends StatefulWidget {
  AllproductsScreenScreen({super.key});

  @override
  State<AllproductsScreenScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<AllproductsScreenScreen> {


  bool isloading = true;

  ProductsModel? productsModel;
  Future getProducts() async {
    productsModel = await ApiProvider().getProducts();
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/premium-vector/people-saving-money_24908-51569.jpg?semt=ais_hybrid"),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Text(
                "Makeup",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          ],
        ),

      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                      ),
                      // child: Row(
                      //   children: [
                      //     Icon(Icons.search),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text("Search")
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 110,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => ProductItem(
                              product: productsModel!.products![index]),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                          itemCount: productsModel!.products!.length),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          ProductItem(product: productsModel!.products![index]),
                      /*separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),*/
                      itemCount: productsModel!.products!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                    ),
                  ],
                ),
              ),
            ),

    );
  }
}

/*Widget buildHeadItem() => SizedBox(
      width: 60,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://c.files.bbci.co.uk/12F5A/production/_109285677_gettyimages-1064010160.jpg"),
              ),
              CircleAvatar(
                radius: 7,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 6,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "YOUSSEF WALID SAAD",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );*/
/*Widget buildCheatItem({required Product product}) => Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(product.thumbnail!),
            ),
            CircleAvatar(
              radius: 7,
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              radius: 6,
              backgroundColor: Colors.green,
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.price!.toString()),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  child: Text(
                    product.description!.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: CircleAvatar(
                    radius: 2,
                  ),
                ),
                Text(product.id!.toString()),
              ],
            ),
          ],
        ),
      ],
    );*/
Widget ProductItem({required Product product}) => Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(product.thumbnail!),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              child: Text(
                product.title!.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(product.price!.toString()),
          ],
        ),
      ],
    );
