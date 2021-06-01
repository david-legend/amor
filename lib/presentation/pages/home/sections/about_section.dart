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
  GlobalKey aboutMeContainerKey = GlobalKey();
  GlobalKey sectionTitleKey = GlobalKey();
  double sectionTitleOffset = 0.0;
  double aboutMeContainerOffset = 0.0;

  @override
  void initState() {
    if (mounted) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _getHeightOfAboutContainer();
      });
    }

    super.initState();
  }

  @override
  void didUpdateWidget(AboutSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (mounted) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _getHeightOfAboutContainer();
      });
    }
  }

  _getHeightOfAboutContainer() {
    final RenderBox sectionTitleRenderBox =
        sectionTitleKey.currentContext?.findRenderObject() as RenderBox;
    final RenderBox aboutContainerRenderBox =
        aboutMeContainerKey.currentContext?.findRenderObject() as RenderBox;

    final sectionTitleHeight = sectionTitleRenderBox.size.height;
    final aboutContainerHeight = aboutContainerRenderBox.size.height;
    setState(() {
      sectionTitleOffset = sectionTitleHeight;
      aboutMeContainerOffset = aboutContainerHeight;
    });
  }

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
      child: Stack(
        children: [
          CustomPaint(
            painter: Circle(
              offset: Offset(
                screenWidth * 0.78,
                sectionTitleOffset + kSpacing16 + (aboutMeContainerOffset / 2),
              ),
              radius: (aboutMeContainerOffset / 2) - kSpacing16,
              color: AppColors.accentColor100,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                key: sectionTitleKey,
                title: StringConst.ABOUT_ME,
              ),
              SizedBox(height: kSpacing16),
              Container(
                key: aboutMeContainerKey,
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
        ],
      ),
    );
  }
}
