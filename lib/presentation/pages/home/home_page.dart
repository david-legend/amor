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
    return Scaffold(
      body: Column(
        children: [
          NavSection(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                HeaderSection(),
                SpaceH24(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Sizes.PADDING_20),
                  child: AboutSection(),
                ),
                SpaceH24(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Sizes.PADDING_20),
                  child: EducationSection(),
                ),
                SpaceH24(),
                ExperienceSection(),
                SkillsSection(),
                FooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
