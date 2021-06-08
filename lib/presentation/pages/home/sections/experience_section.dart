import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/circle.dart';
import 'package:amor/presentation/widgets/experience_column.dart';
import 'package:amor/presentation/widgets/experience_tree.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/presentation/widgets/sub_section_title.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:layout/layout.dart';

const double smCircleRadiusDx = 80;
const double lgCircleRadiusDx = 160;
const double smCircleRadiusDy = 160;
const double lgCircleRadiusDy = 240;

class ExperienceSection extends StatefulWidget {
  @override
  _ExperienceSectionState createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  @override
  Widget build(BuildContext context) {
    double smCircleRadius = context.layout.value(
      xs: smCircleRadiusDx,
      sm: smCircleRadiusDx,
      md: lgCircleRadiusDx,
      lg: lgCircleRadiusDx,
      xl: lgCircleRadiusDx,
    );
    double lgCircleRadius = context.layout.value(
      xs: smCircleRadiusDy,
      sm: smCircleRadiusDy,
      md: lgCircleRadiusDy,
      lg: lgCircleRadiusDy,
      xl: lgCircleRadiusDy,
    );
    double sidePadding = getSidePadding(context);
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double circleWidth = screenWidth * 0.1;
    double smOffsetDx = circleWidth + (smCircleRadius / 2);
    double smOffsetDy = screenHeight * 0.2;
    double lgOffsetDx = -lgCircleRadius / 6;
    double lgOffsetDy = screenHeight * 0.7;
    return Container(
      color: AppColors.darkBlue,
      padding: EdgeInsets.symmetric(
        horizontal: sidePadding,
        vertical: Sizes.PADDING_60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubSectionTitle(
            title: StringConst.MY,
            titleTextColor: AppColors.darkGrey50,
            subtitle: StringConst.EXPERIENCE,
            subtitleTextColor: AppColors.white,
          ),
          SpaceH40(),
          Stack(
            children: [
              Container(
                height: circleWidth,
                width: circleWidth,
                child: CustomPaint(
                  painter: Circle(
                    offset: Offset(lgOffsetDx, lgOffsetDy),
                    radius: lgCircleRadius,
                    color: AppColors.purple500,
                  ),
                ),
              ),
              Container(
                height: circleWidth,
                width: circleWidth,
                child: CustomPaint(
                  painter: Circle(
                    offset:
                        Offset((screenWidth * 0.8) + smOffsetDx, smOffsetDy),
                    radius: smCircleRadius,
                    color: AppColors.purple500,
                  ),
                ),
              ),
              ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  if (sizingInformation.screenSize.width <
                      RefinedBreakpoints().desktopSmall) {
                    return Column(
                      children:
                          _buildExperienceSectionForMobile(Data.experienceData),
                    );
                  } else {
                    return _buildExperienceSection();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildExperienceSectionForMobile(
    List<ExperienceData> experienceData,
  ) {
    List<Widget> content = [];
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? commonStyle = textTheme.bodyText1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.darkWhite,
    );
    for (var index = 0; index < experienceData.length; index++) {
      content.add(
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_12,
            vertical: Sizes.PADDING_16,
          ),
          child: ExperienceColumn(
            title: experienceData[index].title,
            positionTextStyle: textTheme.headline6?.copyWith(
              color: AppColors.white,
            ),
            subtitle: experienceData[index].subtitle,
            companyTextStyle: textTheme.headline6?.copyWith(
              color: AppColors.accentColor,
              fontSize: Sizes.TEXT_SIZE_16,
            ),
            iconData: Icons.arrow_right,
            duration: experienceData[index].duration,
            durationTextStyle: commonStyle,
            location: experienceData[index].location,
            locationTextStyle: commonStyle,
            roles: experienceData[index].body,
            bodyTextStyle: commonStyle,
            bodyBulletIconColor: AppColors.accentColor,
            subtitleUrl: experienceData[index].titleUrl,
          ),
        ),
      );
    }
    return content;
  }

  Widget _buildExperienceSection() {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? experienceTreeHeadStyle = textTheme.subtitle1?.copyWith(
      color: AppColors.accentColor50,
      fontSize: Sizes.TEXT_SIZE_16,
    );
    return ExperienceTree(
      headTitle: StringConst.WORK_CURRENT_MONTH_YEAR,
      tailTitle: StringConst.WORK_STARTED_MONTH_YEAR,
      headTitleStyle: experienceTreeHeadStyle,
      tailTitleStyle: experienceTreeHeadStyle,
      leftLeafTitleStyle: textTheme.bodyText2?.copyWith(
        fontSize: Sizes.TEXT_SIZE_14,
        color: AppColors.darkGrey400,
        fontWeight: FontWeight.bold,
      ),
      leftLeafSubtitleStyle: textTheme.bodyText2?.copyWith(
        color: AppColors.darkGrey400,
        fontSize: Sizes.TEXT_SIZE_15,
        fontWeight: FontWeight.bold,
      ),
      leftLeafIconColor: AppColors.darkGrey400,
      rightLeafTitleStyle: Styles.customTextStyle(
        color: AppColors.accentColor300,
        fontSize: Sizes.TEXT_SIZE_18,
        fontStyle: FontStyle.normal,
      ),
      rightLeafSubtitleStyle: Styles.customTextStyle(
        fontStyle: FontStyle.italic,
        fontSize: Sizes.TEXT_SIZE_15,
        color: AppColors.accentColor300,
      ),
      rightLeafIconData: Icons.arrow_right,
      rightLeafBodyStyle: textTheme.bodyText2?.copyWith(
        color: AppColors.darkGrey150,
        fontSize: Sizes.TEXT_SIZE_15,
        fontWeight: FontWeight.bold,
      ),
      headBackgroundColor: AppColors.darkBlue100,
      tailBackgroundColor: AppColors.darkBlue100,
      veinsColor: AppColors.darkBlue400,
      outerJointColor: AppColors.darkBlue400,
      innerJointColor: AppColors.accentColor50,
      experienceData: Data.experienceData,
      widthOfTree: assignWidth(context, 0.8),
    );
  }
}
