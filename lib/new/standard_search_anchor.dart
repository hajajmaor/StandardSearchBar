import 'package:flutter/material.dart';

import 'package:standard_searchbar/new/standard_search_bar.dart';
import 'package:standard_searchbar/new/standard_search_controller.dart';

/// If there is no StandardSearchController passed in the constructor of
/// StandardSearchBar, then a default one will be created.
class StandardSearchAnchor extends StatefulWidget {
  const StandardSearchAnchor({
    super.key,
    this.controller,
    required this.searchBar,
  });

  final StandardSearchController? controller;
  final StandardSearchBar searchBar;

  @override
  State<StandardSearchAnchor> createState() => StandardSearchAnchorState();
}

class StandardSearchAnchorState extends State<StandardSearchAnchor> {
  late final StandardSearchController controller;
  final unfocus = [false, false];
  final layerLink = LayerLink();
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      controller = widget.controller!;
    } else {
      controller = StandardSearchController();
    }
    controller.anchor = this;
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapInside: (e) {
        controller.open();
      },
      onTapOutside: (e) {
        controller.close();
      },
      child: CompositedTransformTarget(
        link: layerLink,
        child: widget.searchBar,
      ),
    );
  }

  void clear() {
    controller.clear();
  }

  void open() {
    if (entry != null) return;
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    entry = OverlayEntry(builder: (_) {
      return Positioned(
        left: offset.dx,
        top: offset.dy + renderBox.size.height + 16,
        width: renderBox.size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, renderBox.size.height),
          child: Container(
            height: 200,
            color: Colors.red,
          ),
        ),
      );
    });
    Overlay.of(context).insert(entry!);
  }

  void close() {
    if (entry != null) {
      entry!.remove();
      entry = null;
    }
  }
}
