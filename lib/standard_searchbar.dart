library standard_searchbar;

import 'package:flutter/material.dart';
import 'package:standard_searchbar/standard_icon.dart';
import 'package:standard_searchbar/standard_searchbar_region.dart';
import 'package:standard_searchbar/standard_text_field.dart';

class StandardSearchBar extends StatefulWidget {
  const StandardSearchBar({
    super.key,
    this.width,
    this.height = 50,
    this.borderRadius = 25,
    this.backgroundColor = Colors.white,
    this.hintText = 'Search',
    this.hintStyle = const TextStyle(color: Colors.grey),
    this.startIcon = Icons.search,
    this.startIconColor = Colors.grey,
    this.endIcon = Icons.mic,
    this.endIconColor = Colors.grey,
    this.showStartIcon = true,
    this.showEndIcon = false,
    this.cursorColor = Colors.grey,
    this.startIconSplashColor,
    this.startIconOnTap,
    this.endIconOnTap,
    this.endIconSplashColor,
    this.startIconSize = 20,
    this.endIconSize = 20,
    this.horizontalPadding = 10,
    this.startIconPaddingRight = 8,
    this.endIconPaddingLeft = 8,
    this.onSubmitted,
    this.onChanged,
    this.shadow = const [
      BoxShadow(
        color: Colors.black12,
        spreadRadius: 0,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
    this.textStyle = const TextStyle(color: Colors.black),
    this.suggestions,
  });

  /// The width of the search bar. By default is the width of the parent (expanded).
  final double? width;

  /// The height of the search bar. By default is 50.
  final double height;

  /// The border radius of the search bar. By default is 25 (rounded), but it can be
  /// any value.
  final double borderRadius;

  /// The background color of the search bar. By default is white.
  final Color backgroundColor;

  /// The hint text of the SearchBar. By default is 'Search'.
  final String hintText;

  /// The hint text style of the SearchBar. By default is grey.
  final TextStyle hintStyle;

  /// The start icon of the SearchBar. By default is Icons.search.
  final IconData startIcon;

  /// The color of the start icon. By default is grey.
  final Color startIconColor;

  /// The end icon of the SearchBar. By default is Icons.mic.
  final IconData endIcon;

  /// The color of the end icon. By default is grey.
  final Color endIconColor;

  /// Whether to show the start icon or not. By default is true. If false, the
  /// start icon will not be shown and the icon padding will be removed.
  final bool showStartIcon;

  /// Whether to show the end icon or not. By default is false. If true, the
  /// end icon will be shown and the icon padding will be removed.
  final bool showEndIcon;

  /// The color of the cursor. By default is grey.
  final Color cursorColor;

  /// The splash color of the start icon. The splash color is the color that
  /// appears when the icon is tapped. By default is null, because it is calculated
  /// automatically by the Material widget.
  final Color? startIconSplashColor;

  /// The function callback of the startIcon. If it is not null, the end icon will
  /// be clickable and the splash color will be shown. By default is null.
  final Function()? startIconOnTap;

  /// The function callback of the endIcon. If it is not null, the end icon will
  /// be clickable and the splash color will be shown. By default is null.
  final Function()? endIconOnTap;

  /// The splash color of the end icon. The splash color is the color that
  /// appears when the icon is tapped. By default is null, because it is calculated
  /// automatically by the Material widget.
  final Color? endIconSplashColor;

  /// The size of the start icon. By default is 20.
  final double startIconSize;

  /// The size of the end icon. By default is 20.
  final double endIconSize;

  /// The horizontal padding of the search bar. By default is 10.
  final double horizontalPadding;

  /// The right padding of the start icon. By default is 8.
  final double startIconPaddingRight;

  /// The left padding of the end icon. By default is 8.
  final double endIconPaddingLeft;

  /// The function callback of the TextField onSubmitted. By default is null.
  /// This function can be used to search the text with the given value. This
  /// function is called when the user presses the enter key.
  final Function(String)? onSubmitted;

  /// The function callback of the TextField onChanged. By default is null.
  /// This function is executed every time the text changes. So it can be
  /// execute a search every time the user types a letter or it can be used
  /// to update the search suggestions.
  final Function(String)? onChanged;

  /// The shadow of the search bar. By default is a little black shadow. It
  /// can be any value. A list of BoxShadow.
  final List<BoxShadow> shadow;

  /// The text style of the TextField. By default the text color is black.
  final TextStyle textStyle;

  /// The suggestions of the search bar. By default is null. It can be any
  /// value. A list of String.
  final List<String>? suggestions;

  @override
  State<StandardSearchBar> createState() => _StandardSearchBarState();
}

class _StandardSearchBarState extends State<StandardSearchBar> {
  bool isSearchBarFocused = false;
  final TextEditingController controller = TextEditingController();
  late List<String> suggestions;
  bool rebuild = false;

  @override
  void initState() {
    super.initState();
    suggestions = widget.suggestions ?? [];
  }

  void updateSuggestions(String value) {
    if (widget.suggestions == null) return;

    if (value.isEmpty) {
      setState(() => suggestions = widget.suggestions ?? []);
      return;
    }

    // setState(() {
    suggestions = widget.suggestions!
        .where((element) => element.toLowerCase().contains(value.toLowerCase()))
        .toList();
    rebuild = true;
    // });
    print(value);
    // showOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StandardSearchbarRegion(
        isSearchBarFocused: isSearchBarFocused,
        suggestions: suggestions,
        focus: focus,
        unfocus: unfocus,
        borderRadius: widget.borderRadius,
        backgroundColor: widget.backgroundColor,
        onSuggestionSelected: (value) {
          controller.text = value;
          widget.onSubmitted?.call(value);
        },
        rebuild: rebuild,
        child: Container(
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: isSearchBarFocused
                ? BorderRadius.only(
                    topLeft: Radius.circular(widget.borderRadius),
                    topRight: Radius.circular(widget.borderRadius),
                  )
                : BorderRadius.circular(widget.borderRadius),
            boxShadow: widget.shadow,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
            child: Row(
              children: [
                if (widget.showStartIcon != false)
                  StandardIcon(
                    startIcon: widget.startIcon,
                    startIconColor: widget.startIconColor,
                    startIconSize: widget.startIconSize,
                    startIconSplashColor: widget.startIconSplashColor,
                    startIconPaddingRight: widget.startIconPaddingRight,
                  ),
                Expanded(
                  child: StandardTextField(
                    showEndIcon: widget.showEndIcon,
                    endIconPaddingLeft: widget.endIconPaddingLeft,
                    hintText: widget.hintText,
                    hintStyle: widget.hintStyle,
                    cursorColor: widget.cursorColor,
                    textStyle: widget.textStyle,
                    controller: controller,
                    onSubmitted: widget.onSubmitted,
                    onChanged: widget.onChanged,
                    horizontalPadding: widget.horizontalPadding,
                    updateSuggestions: updateSuggestions,
                  ),
                ),
                if (widget.showEndIcon != false)
                  StandardIcon(
                    startIcon: widget.startIcon,
                    startIconColor: widget.startIconColor,
                    startIconSize: widget.startIconSize,
                    startIconSplashColor: widget.startIconSplashColor,
                    startIconPaddingRight: widget.startIconPaddingRight,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void focus() => widget.suggestions != null ? setState(() => isSearchBarFocused = true) : null;
  void unfocus() => widget.suggestions != null ? setState(() => isSearchBarFocused = false) : null;
}
