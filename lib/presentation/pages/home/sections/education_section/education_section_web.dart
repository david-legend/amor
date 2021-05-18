import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/circle.dart';
import 'package:amor/presentation/widgets/experience_tree.dart';
import 'package:amor/presentation/widgets/section_title.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/presentation/widgets/sub_section_title.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class EducationSectionWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double smCircleWidth = screenWidth * 0.1;
    double smOffsetDx = screenWidth * 0.0;
    double smOffsetDy = screenHeight * 0.7;
    double lgOffsetDy = screenHeight * 0.2;
    double bigCircleWidth = screenWidth * 0.2;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: StringConst.RESUME),
          SpaceH16(),
          SubSectionTitle(
            title: StringConst.MY,
            subtitle: StringConst.EDUCATION,
            subtitleTextColor: AppColors.darkGrey200,
          ),
          SpaceH60(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: smCircleWidth,
                width: smCircleWidth,
                child: CustomPaint(
                  painter: Circle(
                    offset: Offset(-100, smOffsetDy),
                    radius: 200,
                    color: AppColors.accentColor50,
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
                height: smCircleWidth,
                width: smCircleWidth,
                child: CustomPaint(
                  painter: Circle(
                    offset: Offset(smCircleWidth + 120, lgOffsetDy),
                    radius: 280,
                    color: AppColors.accentColor50,
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
