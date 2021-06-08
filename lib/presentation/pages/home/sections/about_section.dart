import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/circle.dart';
import 'package:amor/presentation/widgets/section_title.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/presentation/widgets/sub_section_title.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

const double kSpacing16 = Sizes.HEIGHT_16;

class AboutSection extends StatefulWidget {
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = widthOfScreen(context);
    double aboutMeFontSIze = context.layout.value(
      xs: Sizes.TEXT_SIZE_16,
      sm: Sizes.TEXT_SIZE_18,
      md: Sizes.TEXT_SIZE_18,
      lg: Sizes.TEXT_SIZE_18,
      xl: Sizes.TEXT_SIZE_18,
    );
    TextStyle? aboutMeTextStyle = textTheme.bodyText1?.copyWith(
      fontSize: aboutMeFontSIze,
      color: AppColors.accentColor,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.1,
    );
    double containerPadding = context.layout.value(
      xs: Sizes.PADDING_30,
      sm: Sizes.PADDING_40,
      md: Sizes.PADDING_40,
      lg: Sizes.PADDING_40,
      xl: Sizes.PADDING_40,
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: StringConst.ABOUT_ME,
          ),
          SizedBox(height: kSpacing16),
          Container(
            width: screenWidth * 0.85,
            padding: EdgeInsets.all(containerPadding),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: AppRadius.aboutRadius,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubSectionTitle(
                  title: StringConst.PROFESSIONAL,
                  subtitle: StringConst.SUMMARY_TITLE,
                ),
                SpaceH30(),
                SizedBox(
                  width: screenWidth * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        StringConst.ABOUT_ME_SUMMARY_1,
                        style: aboutMeTextStyle,
                      ),
                      SpaceH8(),
                      SelectableText(
                        StringConst.ABOUT_ME_SUMMARY_2,
                        style: aboutMeTextStyle,
                      ),
                      SpaceH8(),
                      SelectableText(
                        StringConst.ABOUT_ME_SUMMARY_3,
                        style: aboutMeTextStyle,
                      ),
                      SpaceH8(),
                      SelectableText(
                        StringConst.ABOUT_ME_SUMMARY_4,
                        style: aboutMeTextStyle,
                      ),
                      SpaceH8(),
                      SelectableText(
                        StringConst.ABOUT_ME_SUMMARY_5,
                        style: aboutMeTextStyle,
                      ),
                      SpaceH8(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
