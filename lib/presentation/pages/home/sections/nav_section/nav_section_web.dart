import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/content_area.dart';
import 'package:amor/presentation/widgets/nav_item.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class NavSectionWeb extends StatefulWidget {
  @override
  _NavSectionWebState createState() => _NavSectionWebState();
}

class _NavSectionWebState extends State<NavSectionWeb> {
  List<NavItemState> navItems = [
    NavItemState(name: StringConst.HOME, isSelected: true),
    NavItemState(name: StringConst.ABOUT),
    NavItemState(name: StringConst.RESUME),
    NavItemState(name: StringConst.SKILLS_AND_CERTIFICATION),
    NavItemState(name: StringConst.CONTACT),
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double sidePadding = widthOfScreen(context) / Sizes.DIVISIONS;
    double screenWidth = widthOfScreen(context);
    double contentAreaWidth = screenWidth * 0.5;

    return Material(
//      elevation: 16,
      child: Container(
        decoration: BoxDecoration(
//          color: Colors.white,
          boxShadow: [
            Shadows.elevationShadow,
          ],
        ),
        child: Row(
          children: [
            ContentArea(
              width: contentAreaWidth,
              height: Sizes.HEIGHT_56,
              backgroundColor: AppColors.white,
              child: Row(
                children: [
                  SizedBox(width: sidePadding),
                  SelectableText(
                    StringConst.NAME_ABBREV,
                    style: textTheme.headline3,
                  ),
                  Spacer(),
                  NavItem(
                    title: navItems[0].name,
                    isSelected: navItems[0].isSelected,
                    textColor: AppColors.darkGrey800,
                    selectedColor: AppColors.deepBlue,
                    onTap: () => _onTapNavItem(navItems[0].name),
                  ),
                  SpaceW40(),
                  NavItem(
                    title: navItems[1].name,
                    isSelected: navItems[1].isSelected,
                    selectedColor: AppColors.deepBlue,
                    textColor: AppColors.darkGrey800,
                    onTap: () => _onTapNavItem(navItems[1].name),
                  ),
                  SpaceW20(),
                ],
              ),
            ),
            ContentArea(
              width: contentAreaWidth,
              height: Sizes.HEIGHT_56,
              backgroundColor: AppColors.purple500,
              child: Row(
                children: [
                  SpaceW20(),
                  NavItem(
                    title: navItems[2].name,
                    isSelected: navItems[2].isSelected,
                    onTap: () => _onTapNavItem(navItems[2].name),
                  ),
                  SpaceW40(),
                  NavItem(
                    title: navItems[3].name,
                    isSelected: navItems[3].isSelected,
                    onTap: () => _onTapNavItem(navItems[3].name),
                  ),
                  SpaceW40(),
                  NavItem(
                    title: navItems[4].name,
                    isSelected: navItems[4].isSelected,
                    onTap: () => _onTapNavItem(navItems[4].name),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onTapNavItem(String navItemName) {
    for (int index = 0; index < navItems.length; index++) {
      if (navItemName == navItems[index].name) {
        setState(() {
          navItems[index].isSelected = true;
        });
      } else {
        navItems[index].isSelected = false;
      }
    }
  }
}
