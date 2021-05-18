import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'footer_section_mobile.dart';
import 'footer_section_web.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: FooterSectionMobile(),
      tablet: FooterSectionWeb(),
      desktop: FooterSectionWeb(),
    );
  }
}
