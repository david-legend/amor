import 'package:flutter/material.dart';

class ContentArea extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Widget? child;

  ContentArea({
    this.width,
    this.height,
    this.backgroundColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: child,
    );
  }
}
