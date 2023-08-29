import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

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
            onChanged: (value) {
              if (kDebugMode) print('Search: $value');
            },
            onSubmitted: (value) {
              if (kDebugMode) print('Search: $value');
            },
          ),
        ),
        backgroundColor: Colors.black12,
      ),
    );
  }
}
