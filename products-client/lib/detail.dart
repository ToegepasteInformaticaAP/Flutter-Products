// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String description;
  const DetailScreen(this.name, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150.0, vertical: 10),
        child: Center(
          child: Text(
            description,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
