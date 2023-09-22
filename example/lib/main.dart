import 'package:flutter/material.dart';

import 'package:standard_searchbar/new/standard_search_anchor.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';

// import 'package:standard_searchbar/standard_searchbar.dart';

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
        body: const SizedBox(
          width: double.infinity,
          child: Center(
            child: StandardSearchAnchor(
              searchBar: StandardSearchBar(),
            ),
          ),
        ),
        // backgroundColor: Colors.black12,
        backgroundColor: const Color(0xFF12202F),
      ),
    );
  }
}
