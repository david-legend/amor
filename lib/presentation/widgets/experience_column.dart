import 'package:amor/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';

class ExperienceColumn extends StatelessWidget {
  ExperienceColumn({
    required this.duration,
    required this.position,
    required this.company,
    required this.location,
    required this.roles,
    this.companyUrl = "",
    this.roleTextStyle,
    this.companyTextStyle,
    this.locationTextStyle,
    this.durationTextStyle,
    this.positionTextStyle,
    this.onTap,
    this.bodyTextStyle,
    this.bodyBulletIconColor = AppColors.purple500,
  });

  final String duration;
  final String position;
  final String company;
  final String companyUrl;
  final String location;
  final List<String> roles;
  final GestureTapCallback? onTap;
  final TextStyle? roleTextStyle;
  final TextStyle? locationTextStyle;
  final TextStyle? companyTextStyle;
  final TextStyle? positionTextStyle;
  final TextStyle? bodyTextStyle;
  final TextStyle? durationTextStyle;
  final Color bodyBulletIconColor;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SelectableText(
                position,
                style: positionTextStyle ??
                    textTheme.headline6?.copyWith(
                      color: AppColors.primaryText,
                    ),
              ),
              SpaceW4(),
              InkWell(
                onTap: onTap ?? () => openUrlLink(companyUrl),
                child: SelectableText(
                  '@' + company,
                  style: companyTextStyle ??
                      textTheme.headline6?.copyWith(
                        color: AppColors.purple500,
                        fontSize: Sizes.TEXT_SIZE_16,
                      ),
                ),
              )
            ],
          ),
          SelectableText(
            location,
            style: locationTextStyle ??
                textTheme.bodyText1?.copyWith(
                  fontSize: Sizes.TEXT_SIZE_16,
                  color: AppColors.primaryText,
                ),
          ),
          SpaceH4(),
          SelectableText(
            duration,
            style: durationTextStyle ??
                textTheme.bodyText1?.copyWith(
                  fontSize: Sizes.TEXT_SIZE_16,
                  color: AppColors.primaryText,
                ),
          ),
          SpaceH16(),
          ..._buildBody(roles),
        ],
      ),
    );
  }

  List<Widget> _buildBody(List<String> roles) {
    List<Widget> bodyWidgets = [];
    for (var index = 0; index < roles.length; index++) {
      bodyWidgets.add(
        Body(
          body: roles[index],
          bodyTextStyle: bodyTextStyle,
          color: bodyBulletIconColor,
        ),
      );
      bodyWidgets.add(SpaceH8());
    }

    return bodyWidgets;
  }
}

class Body extends StatelessWidget {
  Body({
    required this.body,
    this.bodyTextStyle,
    this.icon = Icons.arrow_right,
    this.iconSize = Sizes.ICON_SIZE_18,
    this.color = AppColors.purple500,
  });

  final String body;
  final TextStyle? bodyTextStyle;
  final IconData icon;
  final Color color;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: color,
        ),
        SpaceW8(),
        Expanded(
          child: SelectableText(
            body,
            style: bodyTextStyle ??
                textTheme.bodyText1?.copyWith(
                  color: AppColors.primaryText,
                ),
          ),
        ),
      ],
    );
  }
}
