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
import 'package:layout/layout.dart';

const double smCircleRadiusDx = 80;
const double lgCircleRadiusDx = 160;
const double smCircleRadiusDy = 160;
const double lgCircleRadiusDy = 280;

class EducationSection extends StatelessWidget {
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
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double circleWidth = screenWidth * 0.1;
    double smOffsetDx = -smCircleRadius;
    double smOffsetDy = screenHeight * 0.6;
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
                  if (sizingInformation.screenSize.width <=
                      RefinedBreakpoints().tabletExtraLarge) {
                    return Column(
                      children:
                          _buildEducationSectionForMobile(Data.educationData),
                    );
                  } else {
                    return ExperienceTree(
                      headTitle: StringConst.EDUCATION_CURRENT_MONTH_YEAR,
                      tailTitle: StringConst.EDUCATION_STARTED_MONTH_YEAR,
                      experienceData: Data.educationData,
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
    List<ExperienceData> experienceData,
  ) {
    List<Widget> content = [];
    for (var index = 0; index < experienceData.length; index++) {
      content.add(
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_12,
            vertical: Sizes.PADDING_16,
          ),
          child: ExperienceColumn(
            title: experienceData[index].title,
            subtitle: experienceData[index].subtitle,
            duration: experienceData[index].duration,
            location: experienceData[index].location,
            roles: experienceData[index].body,
            subtitleUrl: experienceData[index].titleUrl,
          ),
        ),
      );
    }
    return content;
  }
}
