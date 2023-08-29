library standard_searchbar;

import 'package:flutter/material.dart';

class StandardSearchBar extends StatelessWidget {
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
  });

  final double? width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final String hintText;
  final TextStyle hintStyle;
  final IconData startIcon;
  final Color startIconColor;
  final IconData endIcon;
  final Color endIconColor;
  final bool showStartIcon;
  final bool showEndIcon;
  final Color cursorColor;
  final Color? startIconSplashColor;
  final Function()? startIconOnTap;
  final Function()? endIconOnTap;
  final Color? endIconSplashColor;
  final double startIconSize;
  final double endIconSize;
  final double horizontalPadding;
  final double startIconPaddingRight;
  final double endIconPaddingLeft;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final List<BoxShadow> shadow;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: shadow,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            children: [
              if (showStartIcon != false)
                Padding(
                  padding: EdgeInsets.only(right: startIconPaddingRight),
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: startIconSplashColor,
                        onTap: startIconOnTap,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            startIcon,
                            color: startIconColor,
                            size: startIconSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: showEndIcon
                      ? EdgeInsets.zero
                      : EdgeInsets.only(right: endIconPaddingLeft),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: hintStyle,
                    ),
                    cursorColor: cursorColor,
                    style: textStyle,
                    onSubmitted: onSubmitted,
                    onChanged: onChanged,
                  ),
                ),
              ),
              if (showEndIcon != false)
                Padding(
                  padding: EdgeInsets.only(left: endIconPaddingLeft),
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: endIconSplashColor,
                        onTap: endIconOnTap,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            endIcon,
                            color: endIconColor,
                            size: endIconSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
