import 'package:flutter/material.dart';

class StandardIcon extends StatelessWidget {
  const StandardIcon({
    super.key,
    required this.startIcon,
    required this.startIconColor,
    required this.startIconSize,
    required this.startIconSplashColor,
    this.startIconOnTap,
    required this.startIconPaddingRight,
  });

  final IconData startIcon;
  final Color startIconColor;
  final double startIconSize;
  final Color? startIconSplashColor;
  final Function()? startIconOnTap;
  final double startIconPaddingRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
