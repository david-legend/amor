import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'nav_section_mobile.dart';
import 'nav_section_web.dart';

class NavSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavSectionMobile(),
      tablet: NavSectionWeb(),
      desktop: NavSectionWeb(),
    );
  }
}
