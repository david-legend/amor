import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/certification_card.dart';
import 'package:amor/presentation/widgets/skill_level.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/presentation/widgets/sub_section_title.dart';
import 'package:amor/utils/functions.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

class SkillsSection extends StatefulWidget {
  @override
  _SkillsSectionState createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double spacing = (screenWidth / 4) / 2;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubSectionTitle(
              title: StringConst.MY_CODING,
              subtitle: StringConst.SKILLS,
              subtitleTextColor: AppColors.darkGrey400,
            ),
            SpaceH40(),
            Wrap(
              spacing: spacing,
              runSpacing: Sizes.SIZE_20,
              children: _buildSkills(Data.skillData),
            ),
            SpaceH60(),
            SubSectionTitle(
              title: StringConst.MY,
              subtitle: StringConst.CERTIFICATIONS,
              subtitleTextColor: AppColors.darkGrey400,
            ),
            SpaceH60(),
            Wrap(
              spacing: Sizes.SIZE_20,
              runSpacing: Sizes.SIZE_20,
              children: _buildCertification(Data.certificationData),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSkills(List<SkillData> data) {
    List<Widget> skills = [];
    double skillWidth = context.layout.value(
      xs: Sizes.WIDTH_100,
      sm: Sizes.WIDTH_120,
      md: Sizes.WIDTH_120,
      lg: Sizes.WIDTH_120,
      xl: Sizes.WIDTH_120,
    );

    for (int index = 0; index < data.length; index++) {
      skills.add(
        SkillLevel(
          skillLevel: data[index].skillLevel,
          skillName: data[index].skillName,
          width: skillWidth,
          height: skillWidth,
        ),
      );
    }
    return skills;
  }

  List<Widget> _buildCertification(List<CertificationData> data) {
    List<Widget> certifications = [];
    double smWidth = assignWidth(context, 0.3);
    double lgWidth = assignWidth(context, 0.5);
    double smHeight = assignHeight(context, 0.3);
    double lgHeight = assignHeight(context, 0.45);
    double certificateHeight = context.layout.value(
      xs: smHeight,
      sm: smHeight,
      md: lgHeight,
      lg: lgHeight,
      xl: lgHeight,
    );
    double certificateWidth = context.layout.value(
      xs: lgWidth,
      sm: smWidth,
      md: smWidth,
      lg: smWidth,
      xl: smWidth,
    );

    for (int i = 0; i < data.length; i++) {
      certifications.add(
        CertificationCard(
          imageUrl: data[i].image,
          onTap: () => openUrlLink(data[i].url),
          title: data[i].title,
          subtitle: data[i].awardedBy,
          border: Border.all(
            color: AppColors.purple50,
            width: Sizes.WIDTH_2,
          ),
          height: certificateHeight,
          width: certificateWidth,
        ),
      );
    }
    return certifications;
  }
}
