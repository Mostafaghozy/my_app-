import 'package:dio/dio.dart';
import 'package:first_app/dio/model/products_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:first_app/dio/model/category_model.dart';

import '../bottom_navigation/category.dart';

class ApiProvider {
  //final dio = Dio();
  ProductsModel? productsModel;
  CategoryModel? categoryModel;

  Future<ProductsModel?> getProducts() async {
    try {
      Response response = await Dio().get(
        "https://dummyjson.com/products",
        queryParameters: {
          "select": "id,title,price,category,description,thumbnail"
        },
      );
      productsModel = ProductsModel.fromJson(response.data);
      print(response.statusCode);
      return productsModel;
    } catch (error) {
      print(error);
    }
  }

  Future<CategoryModel?> getcategory() async {
    try {
      Response response = await Dio().get(
        "https://dummyjson.com/products/category/smartphones",
      );
      categoryModel = CategoryModel.fromJson(response.data);

      return categoryModel;
    } catch (error) {
      print(error);
    }
  }

  userLoginEmail({required String email, required String password}) async {
    try {
      FormData formData =
          FormData.fromMap({"username": email, "password": password});
      Response response =
          await Dio().post("https://dummyjson.com/auth/login", data: formData);
      print(response.data["token"]);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", response.data["token"]);
      String? X = prefs.getString("token");
      print("hello $X");
    } catch (error) {
      print(error);
    }
  }
}
