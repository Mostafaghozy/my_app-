import 'package:flutter/material.dart';

import '../dio/api_provider.dart';
import '../dio/model/category_model.dart';

class Categorys extends StatefulWidget {
  const Categorys({super.key});

  @override
  State<Categorys> createState() => _CategorysState();
}

class _CategorysState extends State<Categorys> {
  bool isloading = true;
  CategoryModel? categoryModel;


  Future getcategory()async{

    categoryModel = await ApiProvider().getcategory();
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {

    super.initState();
    getcategory();
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
                " Phones",
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
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    ProductItem(product: categoryModel!.products![index]),
                /*separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),*/
                itemCount: categoryModel!.products!.length,
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
            product.category!.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(product.id!.toString()),
      ],
    ),
  ],
);


