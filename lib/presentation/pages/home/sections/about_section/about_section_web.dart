import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/section_title.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/presentation/widgets/sub_section_title.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class AboutSectionWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = widthOfScreen(context);
    TextStyle? aboutMeTextStyle = textTheme.bodyText1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.accentColor,
      letterSpacing: 0.8,
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: StringConst.ABOUT_ME),
          SpaceH16(),
          Container(
            width: screenWidth * 0.8,
            padding: EdgeInsets.only(
              left: Sizes.PADDING_40,
              top: Sizes.PADDING_30,
              bottom: Sizes.PADDING_44,
            ),
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
                        Text(
                          StringConst.ABOUT_ME_SUMMARY_1,
                          style: aboutMeTextStyle,
                        ),
                        SpaceH8(),
                        Text(
                          StringConst.ABOUT_ME_SUMMARY_2,
                          style: aboutMeTextStyle,
                        ),
                        SpaceH8(),
                        Text(
                          StringConst.ABOUT_ME_SUMMARY_3,
                          style: aboutMeTextStyle,
                        ),
                        SpaceH8(),
                        Text(
                          StringConst.ABOUT_ME_SUMMARY_4,
                          style: aboutMeTextStyle,
                        ),
                        SpaceH8(),
                        Text(
                          StringConst.ABOUT_ME_SUMMARY_5,
                          style: aboutMeTextStyle,
                        ),
                        SpaceH8(),
                      ],
                    )
//                    Text(
//                      StringConst.ABOUT_ME_SUMMARY_1,
//                      style: textTheme.bodyText1?.copyWith(
//                        fontSize: Sizes.TEXT_SIZE_16,
//                        color: AppColors.accentColor,
//                        letterSpacing: 0.8,
//                      ),
//                    ),
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
