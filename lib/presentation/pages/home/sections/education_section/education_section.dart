import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'education_section_mobile.dart';
import 'education_section_web.dart';

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: EducationSectionMobile(),
      tablet: EducationSectionWeb(),
      desktop: EducationSectionWeb(),
    );
  }
}
