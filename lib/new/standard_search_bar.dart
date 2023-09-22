import 'package:flutter/material.dart';

class StandardSearchBar extends StatelessWidget {
  const StandardSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 56,
      color: Colors.yellow,
      padding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
