import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/circle.dart';
import 'package:amor/presentation/widgets/content_area.dart';
import 'package:amor/presentation/widgets/social_icons.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

const kPadding24 = Sizes.PADDING_24;
const kSpacing20 = Sizes.SIZE_20;

class HeaderSectionWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double sidePadding = widthOfScreen(context) / Sizes.DIVISIONS;
    double contentAreaWidth = assignWidth(context, 0.5);
    double contentAreaHeight = assignHeight(context, 0.7);

    return Container(
      child: Row(
        children: [
          ContentArea(
            width: contentAreaWidth,
            height: contentAreaHeight,
            backgroundColor: AppColors.offWhite,
            child: Padding(
              padding: EdgeInsets.only(left: sidePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaint(
                    painter: Circle(
                      offset: Offset(
                          contentAreaWidth * 0.4, contentAreaWidth * 0.0),
                      radius: Sizes.RADIUS_20,
                      color: AppColors.accentColor,
                    ),
                  ),
                  SpaceH30(),
                  Text(
                    StringConst.INTRO,
                    style: textTheme.bodyText2?.copyWith(
                      fontSize: Sizes.TEXT_SIZE_60,
                    ),
                  ),
                  Text(
                    StringConst.NAME,
                    style: textTheme.subtitle1?.copyWith(
                      fontSize: Sizes.TEXT_SIZE_60,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SpaceH8(),
                  Text(
                    StringConst.PROFESSIONAL_POSITION,
                    style: textTheme.subtitle1,
                  ),
                  SpaceH16(),
                  SocialIcons(
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
                  CustomPaint(
                    painter: Circle(
                      offset: Offset(Sizes.RADIUS_40, contentAreaHeight * 0.15),
                      radius: Sizes.RADIUS_40,
                      color: AppColors.accentColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ContentArea(
            width: contentAreaWidth,
            height: contentAreaHeight,
            backgroundColor: AppColors.primaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: kPadding24),
              child: Stack(
                children: [
                  CustomPaint(
                    painter: Circle(
                      offset: Offset(
                          contentAreaWidth * 0.825, contentAreaHeight * 0.35),
                      color: AppColors.purple100,
                      radius: Sizes.RADIUS_140,
                    ),
                  ),
                  CustomPaint(
                    painter: Circle(
                      offset: Offset(
                        contentAreaWidth * 0.1,
                        contentAreaHeight * 0.9,
                      ),
                      color: AppColors.purple100,
                      radius: Sizes.RADIUS_40,
                    ),
                  ),
                  Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: (contentAreaWidth * 0.5) - kPadding24,
                          child: Text(
                            StringConst.CATCH_LINE,
                            style: textTheme.subtitle1?.copyWith(
                              fontSize: Sizes.TEXT_SIZE_40,
                              color: AppColors.accentColor,
                            ),
                          ),
                        ),
                        Image.asset(
                          ImagePath.sample_4,
                          width: (contentAreaWidth * 0.5) - kPadding24,
                          fit: BoxFit.scaleDown,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
