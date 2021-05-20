import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Key? key;

  SectionTitle({
    this.key,
    required this.title,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      title,
      style: titleStyle ?? textTheme.headline3,
    );
  }
}
