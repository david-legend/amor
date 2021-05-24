import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/pages/home/sections/about_section/about_section.dart';
import 'package:amor/presentation/pages/home/sections/education_section/education_section.dart';
import 'package:amor/presentation/pages/home/sections/experience_section/experience_section.dart';
import 'package:amor/presentation/pages/home/sections/footer_section/footer_section.dart';
import 'package:amor/presentation/pages/home/sections/header_section/header_section.dart';
import 'package:amor/presentation/pages/home/sections/nav_section/nav_section_mobile.dart';
import 'package:amor/presentation/pages/home/sections/nav_section/nav_section_web.dart';
import 'package:amor/presentation/pages/home/sections/skills_section/skills_section.dart';
import 'package:amor/presentation/widgets/nav_item.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

const kDuration = Duration(milliseconds: 600);

class HomePage extends StatelessWidget {
  final List<NavItemData> navItems = [
    NavItemData(name: StringConst.HOME, key: GlobalKey(), isSelected: true),
    NavItemData(name: StringConst.ABOUT, key: GlobalKey()),
    NavItemData(name: StringConst.RESUME, key: GlobalKey()),
    NavItemData(name: StringConst.SKILLS_AND_CERTIFICATION, key: GlobalKey()),
    NavItemData(name: StringConst.CONTACT, key: GlobalKey()),
  ];

  @override
  Widget build(BuildContext context) {
    double sidePadding = widthOfScreen(context) / Sizes.DIVISIONS;
    return Scaffold(
      body: Column(
        children: [
          ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              if (sizingInformation.isMobile) {
                return NavSectionMobile();
              } else {
                return NavSectionWeb(navItems: navItems);
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(key: navItems[0].key, child: HeaderSection()),
                  SpaceH60(),
                  Container(
                    key: navItems[1].key,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sidePadding),
                      child: AboutSection(),
                    ),
                  ),
                  SpaceH60(),
                  Container(
                    key: navItems[2].key,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sidePadding),
                      child: EducationSection(),
                    ),
                  ),
                  SpaceH60(),
                  ExperienceSection(),
                  SpaceH60(),
                  Container(
                    key: navItems[3].key,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sidePadding),
                      child: SkillsSection(),
                    ),
                  ),
                  SpaceH60(),
                  FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  scrollToSection(BuildContext context) {
    Scrollable.ensureVisible(
      context,
      duration: kDuration,
    );
  }
}
