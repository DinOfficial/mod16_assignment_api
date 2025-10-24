import 'dart:convert';
import 'dart:io';

import 'package:mod16_assignment_api/models/products_model.dart';
import 'package:mod16_assignment_api/utils/urls.dart';
import 'package:http/http.dart' as http;

class ProductsController {
  List<Data> products = [];

  // fetch all product
  Future fetchProducts() async {
    final response = await http.get(Uri.parse(Urls.readProductUrl));

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ProductModel model = ProductModel.fromJson(data);
      products = model.data ?? [];
      print(products);
    }
  }


  // create product Controller
  Future<bool> createProduct(
      {
     String ? productName,
     String ? productImg,
     int ? productQuantity,
     int ? productUnitPrice,
     int ? productTotalPrice,
  }
  ) async {
    final response = await http.post(
      Uri.parse(Urls.createProductUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "ProductName": productName,
        "ProductCode": DateTime.now().millisecondsSinceEpoch,
        "Img": productImg,
        "Qty": productQuantity,
        "UnitPrice": productUnitPrice,
        "TotalPrice": productTotalPrice,
      }),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200)  {
      await fetchProducts();
      return true;
    }
    return false;
  }

  // update product by id
  Future<bool> updateProduct(
      {
        String ? productId,
        String ? productName,
        String ? productImg,
        int ? productQuantity,
        int ? productUnitPrice,
        int ? productTotalPrice,
      }
      ) async {
    final response = await http.post(
      Uri.parse(Urls.updateProductUrl(productId.toString())),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "ProductName": productName,
        "ProductCode": DateTime.now().millisecondsSinceEpoch,
        "Img": productImg,
        "Qty": productQuantity,
        "UnitPrice": productUnitPrice,
        "TotalPrice": productTotalPrice,
      }),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200)  {
      await fetchProducts();
      return true;
    }
    return false;
  }

  // delete product by id
  Future<bool> deleteProduct(String id) async {
    final response = await http.get(Uri.parse(Urls.deleteProductUrl(id)));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
