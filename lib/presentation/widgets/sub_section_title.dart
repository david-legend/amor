import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

class SubSectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color? titleTextColor;
  final Color? subtitleTextColor;
  final CrossAxisAlignment crossAxisAlignment;

  SubSectionTitle({
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.titleTextColor,
    this.subtitleTextColor,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double subtitleFontSize = context.layout.value(
      xs: Sizes.TEXT_SIZE_18,
      sm: Sizes.TEXT_SIZE_20,
      md: Sizes.TEXT_SIZE_20,
      lg: Sizes.TEXT_SIZE_20,
      xl: Sizes.TEXT_SIZE_20,
    );
    double titleFontSize = context.layout.value(
      xs: Sizes.TEXT_SIZE_28,
      sm: Sizes.TEXT_SIZE_30,
      md: Sizes.TEXT_SIZE_30,
      lg: Sizes.TEXT_SIZE_30,
      xl: Sizes.TEXT_SIZE_30,
    );
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        SelectableText(
          title,
          style: titleStyle ??
              textTheme.subtitle2?.copyWith(
                fontSize: subtitleFontSize,
                color: titleTextColor ?? AppColors.accentColor,
              ),
        ),
        SpaceH4(),
        SelectableText(
          subtitle,
          style: subtitleStyle ??
              textTheme.headline6?.copyWith(
                fontSize: titleFontSize,
                color: subtitleTextColor ?? AppColors.white,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
