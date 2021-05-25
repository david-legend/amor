import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/circle.dart';
import 'package:amor/presentation/widgets/experience_column.dart';
import 'package:amor/presentation/widgets/experience_tree.dart';
import 'package:amor/presentation/widgets/section_title.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/presentation/widgets/sub_section_title.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

const double smCircleRadius = 200;
const double lgCircleRadius = 280;

class EducationSection extends StatelessWidget {
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
            subtitleTextColor: AppColors.primaryText,
          ),
          SpaceH40(),
          Stack(
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
              Container(
                height: circleWidth,
                width: circleWidth,
                child: CustomPaint(
                  painter: Circle(
                    offset:
                        Offset((screenWidth * 0.8) + lgOffsetDx, lgOffsetDy),
                    radius: lgCircleRadius,
                    color: AppColors.accentColor100,
                  ),
                ),
              ),
              ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  if (sizingInformation.isMobile) {
                    return Column(
                      children:
                          _buildEducationSectionForMobile(Data.experienceData),
                    );
                  } else {
                    return ExperienceTree(
                      headTitle: StringConst.CURRENT_MONTH_YEAR,
                      tailTitle: StringConst.STARTED_MONTH_YEAR,
                      experienceData: Data.experienceData,
                      widthOfTree: assignWidth(context, 0.8),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildEducationSectionForMobile(
      List<ExperienceData> experienceData) {
    List<Widget> content = [];
    for (var index = 0; index < experienceData.length; index++) {
      content.add(
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_12,
            vertical: Sizes.PADDING_16,
          ),
          child: ExperienceColumn(
            position: experienceData[index].title,
            company: experienceData[index].subtitle,
            duration: experienceData[index].duration,
            location: experienceData[index].location,
            roles: experienceData[index].body,
            companyUrl: experienceData[index].titleUrl,
          ),
        ),
      );
    }
    return content;
  }
}
