import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

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

    double titleFontSize = context.layout.value(
      xs: Sizes.TEXT_SIZE_40,
      sm: Sizes.TEXT_SIZE_48,
      md: Sizes.TEXT_SIZE_48,
      lg: Sizes.TEXT_SIZE_48,
      xl: Sizes.TEXT_SIZE_48,
    );
    return SelectableText(
      title,
      style: titleStyle ??
          textTheme.headline3?.copyWith(
            fontSize: titleFontSize,
          ),
    );
  }
}
