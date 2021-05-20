import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/certification_card.dart';
import 'package:amor/presentation/widgets/section_title.dart';
import 'package:amor/presentation/widgets/skill_level.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/presentation/widgets/sub_section_title.dart';
import 'package:amor/utils/functions.dart';
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
//          SectionTitle(title: StringConst.SKILLS_AND_CERTIFICATION),
//          SpaceH16(),
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
            spacing: spacing,
            runSpacing: Sizes.SIZE_20,
            children: _buildCertification(Data.certificationData),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSkills(List<SkillData> data) {
    List<Widget> skills = [];

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

  List<Widget> _buildCertification(List<CertificationData> data) {
    List<Widget> certifications = [];

    for (int i = 0; i < data.length; i++) {
      certifications.add(
        CertificationCard(
          imageUrl: data[i].image,
          onTap: () => openUrlLink(data[i].url),
          title: data[i].title,
          subtitle: data[i].awardedBy,
          height: isDisplaySmallDesktopOrIpadPro(context)
              ? assignHeight(context, 0.3)
              : assignHeight(context, 0.45),
          width: isDisplaySmallDesktopOrIpadPro(context)
              ? assignWidth(context, 0.3)
              : assignWidth(context, data[i].imageSize),
        ),
      );
    }
    return certifications;
  }
}
