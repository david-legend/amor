import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/circle.dart';
import 'package:amor/presentation/widgets/content_area.dart';
import 'package:amor/presentation/widgets/social_icons.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

const kPadding24 = Sizes.PADDING_24;
const kSpacing16 = Sizes.SIZE_20;

class HomeSectionWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double contentAreaWidth = assignWidth(context, 0.5);
    double contentAreaHeight = assignHeight(context, 0.7);
    double cirleWidth = contentAreaWidth * 0.1;

    return Container(
      child: Row(
        children: [
          ContentArea(
            width: contentAreaWidth,
            height: contentAreaHeight,
            backgroundColor: AppColors.offWhite,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _drawCircle(
                    width: cirleWidth,
                    height: cirleWidth,
                    offsetDx: contentAreaWidth * 0.4,
                    offsetDy: contentAreaHeight * 0.0,
                  ),
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
                    spacing: kSpacing16,
                  ),
                  _drawCircle(
                    width: cirleWidth,
                    height: cirleWidth,
                    offsetDx: contentAreaWidth * 0.0,
                    offsetDy: contentAreaHeight * 0.15,
                    radius: Sizes.RADIUS_40,
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
                  _drawCircle(
                    width: cirleWidth,
                    height: cirleWidth,
                    offsetDx: contentAreaWidth * 0.825,
                    offsetDy: contentAreaHeight * 0.35,
                    color: AppColors.primaryColor100,
                    radius: Sizes.RADIUS_140,
                  ),
                  _drawCircle(
                    width: cirleWidth,
                    height: cirleWidth,
                    offsetDx: contentAreaWidth * 0.1,
                    offsetDy: contentAreaHeight * 0.9,
                    color: AppColors.primaryColor100,
                    radius: Sizes.RADIUS_40,
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
                          ImagePath.sample_1,
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

  Widget _drawCircle({
    required double width,
    required double height,
    required double offsetDx,
    required double offsetDy,
    double radius = Sizes.RADIUS_20,
    Color color = AppColors.accentColor,
  }) {
    return Container(
      height: width,
      width: height,
      child: Opacity(
        opacity: 0.9,
        child: CustomPaint(
          painter: Circle(
            offset: Offset(offsetDx, offsetDy),
            radius: radius,
            color: color,
          ),
        ),
      ),
    );
  }
}
