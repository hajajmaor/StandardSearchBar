import 'package:flutter/material.dart';

class StandardSuggestionsBox extends StatelessWidget {
  const StandardSuggestionsBox({
    super.key,
    required this.suggestions,
    required this.borderRadius,
    required this.backgroundColor,
    required this.onSuggestionSelected,
    required this.onTapInside,
    required this.onTapOutside,
  });

  final List<String> suggestions;
  final double borderRadius;
  final Color backgroundColor;
  final Function(String) onSuggestionSelected;
  final Function(PointerEvent) onTapInside;
  final Function(PointerEvent) onTapOutside;

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: onTapOutside,
      onTapInside: onTapInside,
      child: Container(
        height: 175,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius),
            bottomRight: Radius.circular(borderRadius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Material(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            ),
            color: Colors.transparent,
            child: ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onSuggestionSelected(suggestions[index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      suggestions[index],
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
