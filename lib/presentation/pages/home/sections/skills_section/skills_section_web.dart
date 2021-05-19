import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/skill_level.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/presentation/widgets/sub_section_title.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class SkillsSectionWeb extends StatefulWidget {
  @override
  _SkillsSectionWebState createState() => _SkillsSectionWebState();
}

class _SkillsSectionWebState extends State<SkillsSectionWeb> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double spacing = (screenWidth / 4) / 2;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubSectionTitle(
            title: StringConst.MY_CODING,
            subtitle: StringConst.SKILLS,
            subtitleTextColor: AppColors.darkGrey400,
          ),
          SpaceH60(),
          Wrap(
            spacing: spacing,
            runSpacing: Sizes.SIZE_20,
            children: _buildSkills(Data.skillData),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSkills(List<SkillData> data) {
    List<Widget> skills = [];
    double skillWidth = widthOfScreen(context);

    for (int index = 0; index < data.length; index++) {
      skills.add(
        SkillLevel(
          skillLevel: data[index].skillLevel,
          skillName: data[index].skillName,
        ),
      );
    }
    return skills;
  }
}
