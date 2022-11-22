import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String id;
  final Map<String, dynamic> productData;

  const ProductDetailsScreen({
    Key? key,
    required this.id,
    required this.productData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String firstLetter =
        productData['productName'].toString().substring(0, 1).toUpperCase();

    String otherLetters = productData['productName'].toString().substring(1);

    return Scaffold(
      appBar: AppBar(
        title: Text('$firstLetter$otherLetters'),
        backgroundColor: const Color.fromARGB(255, 25, 10, 109),
      ),
      body: const Center(child: Text('ProductDetailsScreen')),
    );
  }
}
