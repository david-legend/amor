import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'header_section_mobile.dart';
import 'header_section_web.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HeaderSectionMobile(),
      tablet: HeaderSectionWeb(),
      desktop: HeaderSectionWeb(),
    );
  }
}
