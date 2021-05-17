import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'about_section_mobile.dart';
import 'about_section_web.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AboutSectionMobile(),
      tablet: AboutSectionWeb(),
      desktop: AboutSectionWeb(),
    );
  }
}
