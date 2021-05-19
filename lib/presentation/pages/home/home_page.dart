import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/pages/home/sections/about_section/about_section.dart';
import 'package:amor/presentation/pages/home/sections/education_section/education_section.dart';
import 'package:amor/presentation/pages/home/sections/experience_section/experience_section.dart';
import 'package:amor/presentation/pages/home/sections/footer_section/footer_section.dart';
import 'package:amor/presentation/pages/home/sections/header_section/header_section.dart';
import 'package:amor/presentation/pages/home/sections/nav_section/nav_section.dart';
import 'package:amor/presentation/pages/home/sections/skills_section/skills_section.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sidePadding = widthOfScreen(context) / Sizes.DIVISIONS;
    return Scaffold(
      body: Column(
        children: [
          NavSection(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                HeaderSection(),
                SpaceH60(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sidePadding),
                  child: AboutSection(),
                ),
                SpaceH60(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sidePadding),
                  child: EducationSection(),
                ),
                SpaceH60(),
                ExperienceSection(),
                SpaceH60(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sidePadding),
                  child: SkillsSection(),
                ),
                SpaceH60(),
                FooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
