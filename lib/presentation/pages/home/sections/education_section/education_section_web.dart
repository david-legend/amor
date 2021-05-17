import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/experience_tree.dart';
import 'package:amor/presentation/widgets/section_title.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/presentation/widgets/sub_section_title.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class EducationSectionWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: StringConst.RESUME),
          SpaceH16(),
          SubSectionTitle(
            title: StringConst.MY,
            subtitle: StringConst.EDUCATION,
            subtitleTextColor: AppColors.grey200,
          ),
//          ExperienceTree(
//            headTitle: StringConst.CURRENT_MONTH_YEAR,
//            tailTitle: StringConst.STARTED_MONTH_YEAR,
//            experienceData: Data.experienceData,
//            widthOfTree: assignWidth(context, 0.60),
//          ),
        ],
      ),
    );
  }
}
