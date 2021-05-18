import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'experience_section_mobile.dart';
import 'experience_section_web.dart';

class ExperienceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ExperienceSectionMobile(),
      tablet: ExperienceSectionWeb(),
      desktop: ExperienceSectionWeb(),
    );
  }
}
