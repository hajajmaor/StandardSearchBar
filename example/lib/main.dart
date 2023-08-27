import 'package:flutter/material.dart';

import 'package:standard_searchbar/standard_searchbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Standard SearchBar Example'),
        ),
        body: Center(
          child: StandardSearchBar(
            width: MediaQuery.of(context).size.width * 0.9,
          ),
        ),
        backgroundColor: Colors.grey[800],
      ),
    );
  }
}
