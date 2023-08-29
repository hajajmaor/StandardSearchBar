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
        body: const Center(
          child: StandardSearchBar(
            width: 350,
            backgroundColor: Color(0xFF35404D),
            hintText: 'Search',
            cursorColor: Colors.white,
            hintStyle: TextStyle(color: Color(0xFF8d9399)),
            startIconColor: Color(0xFF848B92),
            textStyle: TextStyle(color: Colors.white),
            shadow: [
              BoxShadow(
                color: Color.fromARGB(12, 255, 255, 255),
                spreadRadius: 7,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        // backgroundColor: Colors.black12,
        backgroundColor: const Color(0xFF12202F),
      ),
    );
  }
}
