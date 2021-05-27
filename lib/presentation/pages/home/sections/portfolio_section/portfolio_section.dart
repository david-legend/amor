import 'package:amor/presentation/pages/home/sections/portfolio_section/portfolio_section_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PortfolioSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: PortfolioSectionWeb(),
      tablet: PortfolioSectionWeb(),
      desktop: PortfolioSectionWeb(),
    );
  }
}
