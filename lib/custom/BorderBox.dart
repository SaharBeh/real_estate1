import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BorderBox extends StatelessWidget {

  final Widget child;
  final EdgeInsets? padding;
  final double? width, height;

  const BorderBox({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2),
      ),
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Center(child: child),
    );
  }
}
