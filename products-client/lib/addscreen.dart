// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'main.dart';
import 'product.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Product product = Product();

  Future<void> _submit() async {
    _formKey.currentState?.save();

    final dataUrl = Uri.parse('http://localhost:3000/products/add');
    final headers = {'Content-type': 'application/json'};
    final response =
        await post(dataUrl, headers: headers, body: jsonEncode(product));
    print('Status code: ${response.statusCode}');

    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const MainApp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                    decoration: const InputDecoration(labelText: 'ID'),
                    onSaved: (String? value) {
                      product.id = value!;
                    }),
                TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    onSaved: (String? value) {
                      product.name = value!;
                    }),
                TextFormField(
                    decoration: const InputDecoration(labelText: 'Brand'),
                    onSaved: (String? value) {
                      product.brand = value!;
                    }),
                TextFormField(
                    decoration: const InputDecoration(labelText: 'Price'),
                    onSaved: (String? value) {
                      product.price = value!;
                    }),
                TextFormField(
                    decoration: const InputDecoration(labelText: 'Description'),
                    onSaved: (String? value) {
                      product.description = value!;
                    }),
                Container(
                  width: screenSize.width,
                  child: ElevatedButton(
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _submit,
                  ),
                  margin: const EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }
}
