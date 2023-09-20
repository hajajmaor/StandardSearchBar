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
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              StandardSearchBar(
                width: 360,
                suggestions: List.generate(100, (index) {
                  return 'Suggestion ${index + 1}';
                }),
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
        // backgroundColor: Colors.black12,
        backgroundColor: const Color(0xFF12202F),
      ),
    );
  }
}
