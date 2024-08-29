import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../dio/model/categoryList_model.dart';
import '../dio/model/products_model.dart';
import 'CategoryDetailPage.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  bool isLoading = true;
  CategoryListModel? categoryListModel;

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  Future<void> getAllCategory() async {
    try {
      final dio = Dio();
      Response response =
          await dio.get("https://dummyjson.com/products/category-list");
      print(ProductsModel.fromJson);
      setState(() {
        categoryListModel = CategoryListModel.fromJson(response.data);
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: categoryListModel?.categories.length ?? 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return categoryListItem(categoryListModel!.categories[index]);
                },
              ),
            ),
    );
  }

  Widget categoryListItem(String category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailPage(category: category),
          ),
        );
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   radius: 35,
            //   backgroundImage: NetworkImage("https://img.freepik.com/premium-vector/people-saving-money_24908-51569.jpg?semt=ais_hybrid"),
            // ),
            SizedBox(height: 10),
            Text(
              category,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
