import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/utils/functions.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

TextStyle footerTextStyle = Styles.customTextStyle2(
  fontSize: Sizes.TEXT_SIZE_12,
  color: AppColors.accentColor500,
);
TextStyle linkStyle = Styles.customTextStyle2(
  fontSize: Sizes.TEXT_SIZE_12,
  color: AppColors.white,
  decoration: TextDecoration.underline,
);

class Creators extends StatelessWidget {
  final bool hasRightsText;
  final bool hasLocationInfo;
  final bool hasBuiltInfo;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisAlignment builtInfoMainAxisAlignment;
  final MainAxisAlignment locationMainAxisAlignment;
  final bool doesBuiltInfoComesFirst;

  const Creators({
    this.hasRightsText = true,
    this.hasBuiltInfo = true,
    this.hasLocationInfo = true,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.end,
    this.builtInfoMainAxisAlignment = MainAxisAlignment.start,
    this.locationMainAxisAlignment = MainAxisAlignment.start,
    this.doesBuiltInfoComesFirst = true,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          hasRightsText
              ? SelectableText(
                  StringConst.RIGHTS_RESERVED,
                  style: textTheme.bodyText1?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_12,
                    color: AppColors.accentColor500,
                  ),
                )
              : Container(),
          hasRightsText ? SpaceH2() : Container(),
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.isMobile) {
                return Column(
                  mainAxisAlignment: mainAxisAlignment,
                  crossAxisAlignment: crossAxisAlignment,
                  children: [
                    hasLocationInfo
                        ? LocationMadeSection(
                            locationMainAxisAlignment:
                                locationMainAxisAlignment,
                          )
                        : Container(),
                    hasBuiltInfo
                        ? BuiltBySection(
                            builtInfoMainAxisAlignment:
                                builtInfoMainAxisAlignment,
                          )
                        : Container(),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: mainAxisAlignment,
                  crossAxisAlignment: crossAxisAlignment,
                  children: [
                    hasBuiltInfo
                        ? BuiltBySection(
                            builtInfoMainAxisAlignment:
                                builtInfoMainAxisAlignment,
                          )
                        : Container(),
                    hasLocationInfo
                        ? LocationMadeSection(
                            locationMainAxisAlignment:
                                locationMainAxisAlignment,
                          )
                        : Container(),
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

class BuiltBySection extends StatelessWidget {
  final MainAxisAlignment builtInfoMainAxisAlignment;

  const BuiltBySection({
    this.builtInfoMainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: builtInfoMainAxisAlignment,
      children: [
        InkWell(
          onTap: () => openUrlLink(StringConst.DAVID_LEGEND_URL),
          child: RichText(
            text: TextSpan(
              style: footerTextStyle,
              text: "${StringConst.BUILT_BY} ",
              children: [
                TextSpan(
                  text: "${StringConst.DAVID_COBBINA}, ",
                  style: linkStyle,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => openUrlLink(StringConst.DESIGN_URL),
          child: RichText(
            text: TextSpan(
              text: "${StringConst.DESIGNED_BY} ",
              style: footerTextStyle,
              children: [
                TextSpan(
                  text: "${StringConst.ADEEL_RAZA}.",
                  style: linkStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LocationMadeSection extends StatelessWidget {
  final MainAxisAlignment locationMainAxisAlignment;

  const LocationMadeSection({
    this.locationMainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: locationMainAxisAlignment,
      children: [
        SelectableText(
          StringConst.MADE_IN_GHANA,
          style: footerTextStyle,
        ),
        SpaceW4(),
        ClipRRect(
          borderRadius: BorderRadius.all(const Radius.circular(20)),
          child: Image.asset(
            ImagePath.GHANA_FLAG,
            width: Sizes.WIDTH_16,
            height: Sizes.HEIGHT_16,
            fit: BoxFit.cover,
          ),
        ),
        SpaceW4(),
        SelectableText(
          " ${StringConst.WITH_LOVE}",
          style: footerTextStyle,
        ),
        SpaceW4(),
        Icon(
          FontAwesomeIcons.solidHeart,
          color: AppColors.red,
          size: Sizes.ICON_SIZE_12,
        ),
      ],
    );
  }
}
