import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'skills_section_mobile.dart';
import 'skills_section_web.dart';

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: SkillsSectionWeb(),
      tablet: SkillsSectionWeb(),
      desktop: SkillsSectionWeb(),
    );
  }
}
