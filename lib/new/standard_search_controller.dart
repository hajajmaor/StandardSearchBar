import 'package:flutter/material.dart';

import 'package:standard_searchbar/new/standard_search_anchor.dart';

class StandardSearchController extends TextEditingController {
  // Anchor attached to this controller
  StandardSearchAnchorState? _anchor;
  set anchor(StandardSearchAnchorState anchor) => _anchor = anchor;

  void open() => _anchor?.open();
  void close() => _anchor?.close();

  @override
  void clear() {
    super.clear();
    _anchor?.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _anchor?.close();
  }
}
