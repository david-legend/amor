import 'package:amor/presentation/pages/home/sections/about_section/about_section.dart';
import 'package:amor/presentation/pages/home/sections/education_section/education_section.dart';
import 'package:amor/presentation/pages/home/sections/home_section/home_section.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(bottom: Sizes.PADDING_20),
        children: [
          HomeSection(),
          SpaceH24(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_20),
            child: AboutSection(),
          ),
          SpaceH24(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_20),
            child: EducationSection(),
          ),
        ],
      ),
    );
  }
}
