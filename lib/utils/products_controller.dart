import 'dart:convert';

import 'package:mod16_assignment_api/models/products_model.dart';
import 'package:mod16_assignment_api/utils/urls.dart';
import 'package:http/http.dart' as http;

class ProductsController{
  List<Data>products = [];

  Future fetchProducts() async{
    final response = await http.get(Uri.parse(Urls.readProductUrl));

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      ProductModel model = ProductModel.fromJson(data);
      products = model.data ?? [];
      print(products);
    }
  }
}