import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/circle.dart';
import 'package:amor/presentation/widgets/creators.dart';
import 'package:amor/presentation/widgets/social_icons.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:flutter/cupertino.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:layout/layout.dart';

const kSpacing20 = Sizes.SIZE_20;
const double lgCircleRadius = Sizes.RADIUS_24;

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double sidePadding = screenWidth / Sizes.DIVISIONS;
    double footerHeight = screenHeight * 0.2;
    double bottomPadding = context.layout.value(
      xs: Sizes.PADDING_0,
      sm: Sizes.PADDING_24,
      md: Sizes.PADDING_24,
      lg: Sizes.PADDING_24,
      xl: Sizes.PADDING_24,
    );

    return Container(
      width: screenWidth,
      height: footerHeight,
      padding: EdgeInsets.only(
        left: sidePadding,
        right: sidePadding,
        bottom: bottomPadding,
      ),
      color: AppColors.purple500,
      child: Stack(
        children: [
          CustomPaint(
            painter: Circle(
              offset: Offset(screenWidth * 0.05, footerHeight * 0.2),
              radius: Sizes.RADIUS_12,
              color: AppColors.purple150,
            ),
          ),
          CustomPaint(
            painter: Circle(
              offset: Offset(screenWidth * 0.9, footerHeight * 0.3),
              radius: Sizes.RADIUS_28,
              color: AppColors.purple300,
            ),
          ),
          CustomPaint(
            painter: Circle(
              offset: Offset(screenWidth * 0.08, footerHeight * 0.7),
              radius: Sizes.RADIUS_16,
              color: AppColors.lightPurple400,
            ),
          ),
          CustomPaint(
            painter: Circle(
              offset: Offset(screenWidth * 0.80, footerHeight * 0.65),
              radius: Sizes.RADIUS_24,
              color: AppColors.purple150,
            ),
          ),
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.isMobile) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Creators(),
                    SpaceH20(),
                    SocialIcons(
                      iconColor: AppColors.offWhite,
                      icons: [
                        FontAwesomeIcons.linkedin,
                        FontAwesomeIcons.github,
                        FontAwesomeIcons.twitter,
                      ],
                      socialLinks: [
                        StringConst.LINKED_IN_URL,
                        StringConst.GITHUB_URL,
                        StringConst.TWITTER_URL,
                      ],
                      spacing: kSpacing20,
                    ),
                    Spacer(),
                  ],
                );
              } else {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Creators(),
                    Spacer(),
                    SocialIcons(
                      iconColor: AppColors.offWhite,
                      icons: [
                        FontAwesomeIcons.linkedin,
                        FontAwesomeIcons.github,
                        FontAwesomeIcons.twitter,
                      ],
                      socialLinks: [
                        StringConst.LINKED_IN_URL,
                        StringConst.GITHUB_URL,
                        StringConst.TWITTER_URL,
                      ],
                      spacing: kSpacing20,
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
