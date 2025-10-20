import 'package:flutter/material.dart';
import 'package:mod16_assignment_api/models/products_model.dart';

class ProductCard extends StatelessWidget {
  final Data product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 250,
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
                    child: Image.network(
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      product.img != null && product.img.toString().startsWith('http')
                          ? product.img.toString() : "https://tse1.mm.bing.net/th/id/OIP.H1gHhKVbteqm1U5SrwpPgwHaFj?pid=Api&P=0&h=220",
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Hair Care Products ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price \$ 300', style: TextStyle(fontSize: 15)),
                      Text('Qty: 30', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(onPressed: (){}, child: Icon(Icons.shopping_cart)),
                        ElevatedButton(onPressed: (){}, child: Icon(Icons.edit))

                      ]
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}