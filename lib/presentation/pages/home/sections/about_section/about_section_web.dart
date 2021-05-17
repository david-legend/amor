import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class AboutSectionWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = widthOfScreen(context);

    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConst.ABOUT_ME,
              style: textTheme.headline2,
            ),
            SpaceH16(),
            Container(
              width: screenWidth,
              padding: EdgeInsets.all(Sizes.PADDING_20),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: AppRadius.aboutRadius,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConst.PROFESSIONAL,
                    style: textTheme.subtitle2?.copyWith(
                      fontSize: Sizes.TEXT_SIZE_20,
                      color: AppColors.accentColor,
                    ),
                  ),
                  SpaceH8(),
                  Text(
                    StringConst.SUMMARY_TITLE,
                    style: textTheme.subtitle1?.copyWith(
                      fontSize: Sizes.TEXT_SIZE_24,
                      color: AppColors.white,
                    ),
                  ),
                  SpaceH16(),
                  SizedBox(
                    width: screenWidth * 0.7,
                    child: Text(
                      StringConst.ABOUT_ME_SUMMARY,
                      style: textTheme.bodyText1?.copyWith(
                        fontSize: Sizes.TEXT_SIZE_16,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
