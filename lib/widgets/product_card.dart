import 'package:flutter/material.dart';
import 'package:mod16_assignment_api/models/products_model.dart';

class ProductCard extends StatelessWidget {
  final Data product;
  final VoidCallback onDelete;
  final VoidCallback onEdit;


  const ProductCard({
    super.key,
    required this.product,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      product.img != null && product.img.toString().startsWith('http')
                          ? product.img.toString() : "https://tse1.mm.bing.net/th/id/OIP.H1gHhKVbteqm1U5SrwpPgwHaFj?pid=Api&P=0&h=220",
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(product.productName.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, overflow: TextOverflow.ellipsis)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price \$${product.unitPrice}', style: TextStyle(fontSize: 15)),
                      Text('Qty: ${product.qty}', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(onPressed: onEdit, child: Icon(Icons.edit)),
                        ElevatedButton(onPressed: onDelete, child: Icon(Icons.delete, color: Colors.red,)),
                      ]
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}