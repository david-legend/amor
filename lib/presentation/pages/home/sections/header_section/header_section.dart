import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/circle.dart';
import 'package:amor/presentation/widgets/content_area.dart';
import 'package:amor/presentation/widgets/social_icons.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import 'package:responsive_builder/responsive_builder.dart';

const kPadding24 = Sizes.PADDING_24;
const kSpacing20 = Sizes.SIZE_20;

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double sidePadding = widthOfScreen(context) / Sizes.DIVISIONS;
    double contentAreaWidth = assignWidth(context, 0.5);
    double contentAreaHeight = assignHeight(context, 0.7);
    double introTextSize = context.layout.value(
      xs: Sizes.TEXT_SIZE_30,
      sm: Sizes.TEXT_SIZE_30,
      md: Sizes.TEXT_SIZE_60,
      lg: Sizes.TEXT_SIZE_60,
      xl: Sizes.TEXT_SIZE_60,
    );
    double professionalTextSize = context.layout.value(
      xs: Sizes.TEXT_SIZE_16,
      sm: Sizes.TEXT_SIZE_16,
      md: Sizes.TEXT_SIZE_20,
      lg: Sizes.TEXT_SIZE_20,
      xl: Sizes.TEXT_SIZE_20,
    );

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
                        contentAreaWidth * 0.4,
                        contentAreaWidth * 0.0,
                      ),
                      radius: Sizes.RADIUS_20,
                      color: AppColors.accentColor,
                    ),
                  ),
                  SpaceH30(),
                  SelectableText(
                    StringConst.INTRO,
                    style: GoogleFonts.merriweather(
                      fontSize: introTextSize, // Sizes.textSize_60,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SelectableText(
                    StringConst.NAME,
                    style: textTheme.headline2?.copyWith(
                      fontSize: introTextSize,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SpaceH8(),
                  SelectableText(
                    StringConst.PROFESSIONAL_POSITION,
                    style: textTheme.bodyText1?.copyWith(
                      fontSize: professionalTextSize,
                      fontWeight: FontWeight.w300,
                    ),
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
              padding: EdgeInsets.only(left: Sizes.PADDING_40),
              child: Stack(
                children: [
                  CustomPaint(
                    painter: Circle(
                      offset: Offset(
                        contentAreaWidth * 0.825,
                        contentAreaHeight * 0.35,
                      ),
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
                    child: ResponsiveBuilder(
                      builder: (context, sizingInformation) {
                        double screenWidth = sizingInformation.screenSize.width;
                        if (screenWidth < RefinedBreakpoints().desktopSmall) {
                          return _buildCatchLineAndImage(
                            context,
                            isCatchLineVisible: false,
                            width: (contentAreaWidth * 0.9),
                          );
                        } else {
                          return _buildCatchLineAndImage(
                            context,
                            isCatchLineVisible: true,
                            width: (contentAreaWidth * 0.5),
                          );
                        }
                      },
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

  Widget _buildCatchLineAndImage(
    BuildContext context, {
    required width,
    isCatchLineVisible = true,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        isCatchLineVisible
            ? SizedBox(
                width: width - kPadding24,
                child: SelectableText(
                  StringConst.CATCH_LINE,
                  style: textTheme.headline3?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_40,
                    fontWeight: FontWeight.w100,
                    color: AppColors.accentColor,
                  ),
                ),
              )
            : Container(),
        Image.asset(
          ImagePath.sm_11,
          width: width - kPadding24,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
