import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class SubSectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final CrossAxisAlignment crossAxisAlignment;

  SubSectionTitle({
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: titleStyle ??
              textTheme.subtitle2?.copyWith(
                fontSize: Sizes.TEXT_SIZE_20,
                color: AppColors.accentColor,
              ),
        ),
        SpaceH8(),
        Text(
          subtitle,
          style: subtitleStyle ??
              textTheme.subtitle1?.copyWith(
                fontSize: Sizes.TEXT_SIZE_24,
                color: AppColors.white,
              ),
        ),
      ],
    );
  }
}
