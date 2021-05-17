import 'package:amor/presentation/pages/home/sections/home_section/home_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeSection(),
        ],
      ),
    );
  }
}
