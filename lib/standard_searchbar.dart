library standard_searchbar;

import 'package:flutter/material.dart';

class StandardSearchBar extends StatefulWidget {
  const StandardSearchBar({
    super.key,
    this.width,
    this.height = 50,
    this.borderRadius = 25,
    this.backgroundColor = Colors.white,
    this.hintText = 'Search',
    this.hintColor = Colors.grey,
    this.startIcon = Icons.search,
    this.startIconColor = Colors.grey,
    this.endIcon = Icons.mic,
    this.endIconColor = Colors.grey,
    this.showStartIcon = true,
    this.showEndIcon = true,
    this.cursorColor = Colors.grey,
    this.textColor = Colors.black,
    this.startIconSplashColor,
    this.startIconOnTap,
  });

  final double? width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final String hintText;
  final Color hintColor;
  final IconData startIcon;
  final Color startIconColor;
  final IconData endIcon;
  final Color endIconColor;
  final bool showStartIcon;
  final bool showEndIcon;
  final Color cursorColor;
  final Color textColor;
  final Color? startIconSplashColor;
  final Function()? startIconOnTap;

  @override
  State<StandardSearchBar> createState() => _StandardSearchBarState();
}

class _StandardSearchBarState extends State<StandardSearchBar> {
  final padding = 8.0;
  OverlayEntry? entry;
  final layerLink = LayerLink();

  String mutableProperty = 'Initial Value';

  void updateProperty() {
    setState(() {
      mutableProperty = 'New Value';
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CompositedTransformTarget(
        link: layerLink,
        child: Container(
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              children: [
                if (widget.showStartIcon != false)
                  Padding(
                    padding: EdgeInsets.only(right: padding),
                    child: ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: widget.startIconSplashColor,
                          onTap: widget.startIconOnTap,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              widget.startIcon,
                              color: widget.startIconColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(color: widget.hintColor),
                    ),
                    cursorColor: widget.cursorColor,
                    style: TextStyle(color: widget.textColor),
                  ),
                ),
                if (widget.showEndIcon != false)
                  Padding(
                    padding: EdgeInsets.only(left: padding),
                    child: Icon(widget.endIcon, color: widget.endIconColor),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showOverlay() {
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
          child: buildOverlay(),
        ),
      ),
    );

    overlay.insert(entry!);
  }

  Widget buildOverlay() {
    return Container(
      height: 250,
      color: widget.backgroundColor,
    );
  }
}
