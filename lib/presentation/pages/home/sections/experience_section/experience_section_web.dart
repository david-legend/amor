import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/circle.dart';
import 'package:amor/presentation/widgets/experience_tree.dart';
import 'package:amor/presentation/widgets/sub_section_title.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

const double smCircleRadius = 200;
const double lgCircleRadius = 280;

class ExperienceSectionWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                EdgeInsets.only(left: Sizes.MARGIN_40, top: Sizes.MARGIN_40),
            child: SubSectionTitle(
              title: StringConst.MY,
              titleTextColor: AppColors.darkGrey50,
              subtitle: StringConst.EXPERIENCE,
              subtitleTextColor: AppColors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Spacer(),
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
                  rightLeafTitleStyle: textTheme.subtitle1?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_18,
                    color: AppColors.accentColor300,
                  ),
                  rightLeafSubtitleStyle: textTheme.subtitle2?.copyWith(
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
                Spacer(),
                Container(
                  height: circleWidth,
                  width: circleWidth,
                  child: CustomPaint(
                    painter: Circle(
                      offset: Offset(smOffsetDx, smOffsetDy),
                      radius: smCircleRadius,
                      color: AppColors.purple500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
