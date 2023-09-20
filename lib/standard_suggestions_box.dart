import 'package:flutter/material.dart';

class StandardSuggestionsBox extends StatelessWidget {
  const StandardSuggestionsBox({
    super.key,
    required this.suggestions,
    required this.borderRadius,
    required this.backgroundColor,
  });

  final List<String> suggestions;
  final double borderRadius;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
        color: Colors.transparent,
        child: ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestions[index]),
            );
          },
        ),
      ),
    );
  }
}
