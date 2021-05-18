import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/content_area.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class NavSectionWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double contentAreadWidth = screenWidth * 0.5;

    return Material(
      elevation: 16,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: [
            ContentArea(
              width: contentAreadWidth,
              height: Sizes.HEIGHT_56,
              backgroundColor: AppColors.offWhite,
              child: Row(
                children: [
                  SpaceW20(),
                  Text('JM'),
                  Spacer(),
                  Text('Home'),
                  SpaceW8(),
                  Text('About Me'),
                  SpaceW20(),
                ],
              ),
            ),
            ContentArea(
              width: contentAreadWidth,
              height: Sizes.HEIGHT_56,
              backgroundColor: AppColors.primaryColor,
              child: Row(
                children: [
                  SpaceW20(),
                  SpaceW8(),
                  Text('Resume'),
                  SpaceW8(),
                  Text('Skills'),
                  SpaceW8(),
                  Text('Contact Me')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
