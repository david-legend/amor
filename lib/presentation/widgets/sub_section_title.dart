import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

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
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        SelectableText(
          title,
          style: titleStyle ??
              textTheme.subtitle2?.copyWith(
                fontSize: Sizes.textSize_20,
                color: titleTextColor ?? AppColors.accentColor,
              ),
        ),
        SpaceH4(),
        SelectableText(
          subtitle,
          style: subtitleStyle ??
              textTheme.headline6?.copyWith(
                fontSize: Sizes.textSize_30,
                color: subtitleTextColor ?? AppColors.white,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
