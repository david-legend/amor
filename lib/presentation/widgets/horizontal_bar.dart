import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class HorizontalBar extends StatelessWidget {
  HorizontalBar({
    this.width = Sizes.WIDTH_20,
    this.height = Sizes.HEIGHT_2,
    this.color = AppColors.accentColor100, //AppColors.secondaryColor
    this.margin,
  });

  final double width;
  final double height;
  final Color color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      color: color,
    );
  }
}
