import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail.dart';
import 'product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _products = <Product>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    const dataUrl = 'http://localhost:3000/products';
    final response = await http.get(Uri.parse(dataUrl));

    setState(() {
      final dataList = json.decode(response.body) as List;
      for (final item in dataList) {
        final id = item['id'] as String;
        final name = item['name'] as String;
        final brand = item['brand'] as String;
        final price = item['price'] as String;
        final description = item['description'] as String;
        final product = Product(id, name, brand, price, description);
        _products.add(product);
      }
    });
  }

  Widget _buildRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Text('${_products[i].name} : ${_products[i].price} €',
            style: _biggerFont),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => DetailScreen(
                  '${_products[i].name}', '${_products[i].description}'),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemCount: _products.length,
          itemBuilder: (BuildContext context, int position) {
            return _buildRow(position);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          }),
    );
  }
}
