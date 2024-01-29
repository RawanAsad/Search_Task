import 'package:dio/dio.dart';
import 'package:saerch_task2/model/All_products.dart';

GetProducts() async {
  Dio dio = Dio();

  Response response = await dio.get('https://dummyjson.com/products');

  if (response.statusCode == 200) {
    print(response.data['products']);
    return response.data;
  } else {
    return false;
  }
}

GetOneProduct(int id) async {
  Dio dio = Dio();

  Response response = await dio.get('https://dummyjson.com/products/${id}');

  if (response.statusCode == 200) {
    dynamic temp = response.data;
    ProductDetailsModel Products = ProductDetailsModel.fromMap(temp);
    print(Products);
    return Products;
  } else {
    return false;
  }
}
