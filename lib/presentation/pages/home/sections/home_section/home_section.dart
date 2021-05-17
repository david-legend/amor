import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_section_mobile.dart';
import 'home_section_web.dart';

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeSectionMobile(),
      tablet: HomeSectionWeb(),
      desktop: HomeSectionWeb(),
    );
  }
}
