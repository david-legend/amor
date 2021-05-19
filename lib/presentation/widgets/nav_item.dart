import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class NavItemState {
  final String name;
  bool isSelected;

  NavItemState({
    required this.name,
    this.isSelected = false,
  });
}

class NavItem extends StatelessWidget {
  NavItem({
    required this.title,
    this.isSelected = false,
    this.titleStyle,
    this.textColor = AppColors.white,
    this.selectedColor = AppColors.accentColor,
    this.onTap,
  });

  final String title;
  bool isSelected;
  final Color textColor;
  final Color selectedColor;
  final TextStyle? titleStyle;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Text(
          title,
          style: titleStyle ??
              textTheme.bodyText1?.copyWith(
                color: isSelected ? selectedColor : textColor,
                fontSize: Sizes.TEXT_SIZE_14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ),
    );
  }
}
