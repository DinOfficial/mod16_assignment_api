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

  createEditProductDialog({
    String? id,
    String? name,
    String? image,
    int? quantity,
    int? unitPrice,
    int? totalPrice,
    required bool isUpdate,
  }) {
    TextEditingController productNameController = TextEditingController(
      text: name != null ? name : '',
    );
    TextEditingController productImageController = TextEditingController(
      text: image,
    );
    TextEditingController productQuantityController = TextEditingController(
      text: quantity != null ? quantity.toString() : '',
    );
    TextEditingController productUnitPriceController = TextEditingController(
      text: unitPrice != null ? unitPrice.toString() : '',
    );
    TextEditingController productTotalPriceController = TextEditingController(
      text: totalPrice != null ? totalPrice.toString() : '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          isUpdate ? 'Update Product' : 'Create Product',
          style: TextStyle(fontSize: 16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: productNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: productImageController,
              decoration: InputDecoration(
                labelText: 'Product Image',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: productQuantityController,
              decoration: InputDecoration(
                labelText: 'Product Quantity',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: productUnitPriceController,
              decoration: InputDecoration(
                labelText: 'Product Unit Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: productTotalPriceController,
              decoration: InputDecoration(
                labelText: 'Product Total Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    isUpdate
                        ? await productsController.updateProduct(
                            productId: id,
                            productName: productNameController.text,
                            productImg: productImageController.text,
                            productQuantity: int.parse(
                              productQuantityController.text,
                            ),
                            productUnitPrice: int.parse(
                              productUnitPriceController.text,
                            ),
                            productTotalPrice: int.parse(
                              productTotalPriceController.text,
                            ),
                          )
                        : await productsController.createProduct(
                            productName: productNameController.text,
                            productImg: productImageController.text,
                            productQuantity: int.parse(
                              productQuantityController.text,
                            ),
                            productUnitPrice: int.parse(
                              productUnitPriceController.text,
                            ),
                            productTotalPrice: int.parse(
                              productTotalPriceController.text,
                            ),
                          );
                    if (mounted) {
                      await fetchData();
                    }
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text(isUpdate ? 'Update' : 'Create'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    dispose() {
      productNameController.dispose();
      productImageController.dispose();
      productQuantityController.dispose();
      productUnitPriceController.dispose();
      productTotalPriceController.dispose();
      super.dispose();
    }

    ;
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
                      productsController
                          .deleteProduct(product.sId.toString())
                          .then((value) {
                            if (value) {
                              setState(() {
                                productsController.products.removeWhere(
                                  (item) => item.sId == product.sId,
                                );
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Product Deleted Successfully'),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Something Went Wrong'),
                                ),
                              );
                            }
                          });
                    },
                    onEdit: () {
                      createEditProductDialog(
                        isUpdate: true,
                        id: product.sId,
                        name: product.productName,
                        image: product.img,
                        quantity: product.qty,
                        unitPrice: product.unitPrice,
                        totalPrice: product.totalPrice,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createEditProductDialog(isUpdate: false);
        },
        child: Icon(Icons.add, size: 30),
      ),
    );
  }
}
