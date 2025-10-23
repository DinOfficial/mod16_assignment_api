import 'package:flutter/material.dart';
import 'package:mod16_assignment_api/utils/products_controller.dart';

import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductsController productsController = ProductsController();

  Future<void> fetchData() async {
    await productsController.fetchProducts();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'All Products',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: productsController.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: .6,
                ),
                itemBuilder: (context, index) {
                  final product = productsController.products[index];
                  return ProductCard(
                    product: product,
                    onDelete: () {
                      productsController.deleteProduct(product.sId.toString()).then((value) {
                        if (value) {
                          setState(() {
                            productsController.products.removeWhere((item) => item.sId == product.sId);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Product Deleted Successfully')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Something Went Wrong')),
                          );
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
