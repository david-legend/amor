import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/creators.dart';
import 'package:amor/presentation/widgets/social_icons.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/utils/functions.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'circular_container.dart';
import 'nav_item.dart';

const kSpacing20 = Sizes.SIZE_20;

class AppDrawer extends StatefulWidget {
  final Color color;
  final double? width;
  final List<NavItemData> menuList;
  final GestureTapCallback? onClose;

  AppDrawer({
    this.color = AppColors.purple500,
    this.width,
    required this.menuList,
    this.onClose,
  });

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? assignWidth(context, 0.7),
      child: Drawer(
        child: Container(
          color: widget.color,
          child: Column(
            children: [
              SpaceH16(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: widget.onClose ?? () => _closeDrawer(),
                    child: CircularContainer(
                      color: AppColors.purple50,
                      width: Sizes.WIDTH_30,
                      height: Sizes.HEIGHT_30,
                      child: Icon(
                        Icons.close,
                        size: Sizes.ICON_SIZE_20,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              ..._buildMenuList(
                context: context,
                menuList: widget.menuList,
              ),
              Spacer(flex: 3),
              SocialIcons(
                icons: [
                  FontAwesomeIcons.linkedin,
                  FontAwesomeIcons.github,
                  FontAwesomeIcons.twitter,
                ],
                iconColor: AppColors.offWhite,
                socialLinks: [
                  StringConst.LINKED_IN_URL,
                  StringConst.GITHUB_URL,
                  StringConst.TWITTER_URL,
                ],
                spacing: kSpacing20,
              ),
              SpaceH24(),
              Creators(
                hasRightsText: false,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                builtInfoMainAxisAlignment: MainAxisAlignment.center,
                locationMainAxisAlignment: MainAxisAlignment.center,
                doesBuiltInfoComesFirst: false,
              ),
              SpaceH24(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<NavItemData> menuList,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        NavItem(
          onTap: () => _onTapNavItem(
            context: menuList[i].key,
            navItemName: menuList[i].name,
          ),
          title: menuList[i].name,
          isSelected: menuList[i].isSelected,
          titleStyle: textTheme.bodyText1?.copyWith(
            color: menuList[i].isSelected
                ? AppColors.accentColor
                : AppColors.white,
            fontSize: Sizes.TEXT_SIZE_18,
            fontWeight:
                menuList[i].isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
      menuItems.add(Spacer());
    }
    return menuItems;
  }

  _onTapNavItem({
    required GlobalKey context,
    required String navItemName,
  }) {
    for (int index = 0; index < widget.menuList.length; index++) {
      if (navItemName == widget.menuList[index].name) {
        scrollToSection(context.currentContext!);
        setState(() {
          widget.menuList[index].isSelected = true;
        });
        _closeDrawer();
      } else {
        widget.menuList[index].isSelected = false;
      }
    }
  }

  _closeDrawer() {
    context.router.pop();
  }
}
