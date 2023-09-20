import 'package:flutter/material.dart';

import 'package:standard_searchbar/standard_suggestions_box.dart';

class StandardSearchbarRegion extends StatefulWidget {
  const StandardSearchbarRegion({
    super.key,
    required this.isSearchBarFocused,
    required this.focus,
    required this.unfocus,
    this.suggestions,
    required this.borderRadius,
    required this.backgroundColor,
    required this.onSuggestionSelected,
    required this.rebuild,
    required this.child,
  });

  final bool isSearchBarFocused;
  final Function() focus;
  final Function() unfocus;
  final List<String>? suggestions;
  final double borderRadius;
  final Color backgroundColor;
  final Function(String) onSuggestionSelected;
  final bool rebuild;
  final Widget child;

  @override
  State<StandardSearchbarRegion> createState() => _SearchbarRegionState();
}

class _SearchbarRegionState extends State<StandardSearchbarRegion> {
  OverlayEntry? entry;
  final layerLink = LayerLink();
  final unfocus = [false, false];

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapInside: (e) {
        unfocus[1] = false;
        widget.focus();
        if (widget.suggestions == null) return;
        if (widget.isSearchBarFocused) return;
        showOverlay();
      },
      onTapOutside: (e) {
        unfocus[1] = true;
        requestUnFocus(1);
      },
      child: CompositedTransformTarget(
        link: layerLink,
        child: widget.child,
      ),
    );
  }

  void showOverlay() {
    if (widget.suggestions == null) return;

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    entry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 16,
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height),
          child: StandardSuggestionsBox(
            suggestions: widget.suggestions!,
            borderRadius: widget.borderRadius,
            backgroundColor: widget.backgroundColor,
            onSuggestionSelected: (s) {
              widget.onSuggestionSelected(s);
              unFocus();
            },
            onTapInside: (e) {
              unfocus[0] = false;
            },
            onTapOutside: (e) {
              unfocus[0] = true;
              Future.delayed(const Duration(milliseconds: 100), () {
                requestUnFocus(0);
              });
            },
          ),
        ),
      ),
    );

    overlay.insert(entry!);
  }

  void requestUnFocus(int n) {
    if (unfocus[0] && unfocus[1]) {
      unFocus();
      unfocus[0] = false;
      unfocus[1] = false;
    }
  }

  void unFocus() {
    widget.unfocus();
    if (widget.suggestions == null) return;
    if (!widget.isSearchBarFocused) return;
    entry?.remove();
  }
}
