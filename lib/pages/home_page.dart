import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Products',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: 20,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .7
                ),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 200,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    height: 160,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                    'https://t4.ftcdn.net/jpg/04/02/75/95/360_F_402759588_si9oFbEM4Tb60yHO5R2SfWrSLp2A5nYo.jpg',
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('Hair Care Products '),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
