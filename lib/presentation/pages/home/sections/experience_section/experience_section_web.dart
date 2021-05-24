import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/circle.dart';
import 'package:amor/presentation/widgets/experience_tree.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/presentation/widgets/sub_section_title.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

const double smCircleRadius = 200;
const double lgCircleRadius = 280;

class ExperienceSectionWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double sidePadding = widthOfScreen(context) / Sizes.DIVISIONS;
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double circleWidth = screenWidth * 0.1;
    double smOffsetDx = circleWidth + (smCircleRadius / 2);
    double smOffsetDy = screenHeight * 0.2;
    double lgOffsetDx = -lgCircleRadius / 6;
    double lgOffsetDy = screenHeight * 0.7;
    TextStyle? experienceTreeHeadStyle = textTheme.subtitle1?.copyWith(
      color: AppColors.accentColor50,
      fontSize: Sizes.TEXT_SIZE_16,
    );
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
              ExperienceTree(
                headTitle: StringConst.CURRENT_MONTH_YEAR,
                tailTitle: StringConst.STARTED_MONTH_YEAR,
                headTitleStyle: experienceTreeHeadStyle,
                tailTitleStyle: experienceTreeHeadStyle,
                leftLeafTitleStyle: textTheme.bodyText2?.copyWith(
                  fontSize: Sizes.TEXT_SIZE_12,
                  color: AppColors.darkGrey400,
                  fontWeight: FontWeight.bold,
                ),
                leftLeafSubtitleStyle: textTheme.bodyText2?.copyWith(
                  color: AppColors.darkGrey400,
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
                  color: AppColors.accentColor300,
                ),
                rightLeafBodyStyle: textTheme.bodyText2?.copyWith(
                  color: AppColors.darkGrey150,
                  fontWeight: FontWeight.bold,
                ),
                headBackgroundColor: AppColors.darkBlue100,
                tailBackgroundColor: AppColors.darkBlue100,
                veinsColor: AppColors.darkBlue400,
                outerJointColor: AppColors.darkBlue400,
                innerJointColor: AppColors.accentColor50,
                experienceData: Data.experienceData,
                widthOfTree: assignWidth(context, 0.60),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
