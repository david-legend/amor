import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/circle.dart';
import 'package:amor/presentation/widgets/experience_tree.dart';
import 'package:amor/presentation/widgets/section_title.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/presentation/widgets/sub_section_title.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

const double smCircleRadius = 200;
const double lgCircleRadius = 280;

class EducationSectionWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double circleWidth = screenWidth * 0.1;
    double smOffsetDx = -smCircleRadius / 2;
    double smOffsetDy = screenHeight * 0.7;
    double lgOffsetDx = circleWidth + (lgCircleRadius / 3);
    double lgOffsetDy = screenHeight * 0.2;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: StringConst.RESUME),
          SpaceH16(),
          SubSectionTitle(
            title: StringConst.MY,
            subtitle: StringConst.EDUCATION,
            subtitleTextColor: AppColors.darkGrey400,
          ),
          SpaceH60(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: circleWidth,
                width: circleWidth,
                child: CustomPaint(
                  painter: Circle(
                    offset: Offset(smOffsetDx, smOffsetDy),
                    radius: smCircleRadius,
                    color: AppColors.accentColor100,
                  ),
                ),
              ),
              Spacer(),
              ExperienceTree(
                headTitle: StringConst.CURRENT_MONTH_YEAR,
                tailTitle: StringConst.STARTED_MONTH_YEAR,
                experienceData: Data.experienceData,
                widthOfTree: assignWidth(context, 0.60),
              ),
              Spacer(),
              Container(
                height: circleWidth,
                width: circleWidth,
                child: CustomPaint(
                  painter: Circle(
                    offset: Offset(lgOffsetDx, lgOffsetDy),
                    radius: lgCircleRadius,
                    color: AppColors.accentColor100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
