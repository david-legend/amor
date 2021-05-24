import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/tree_painter.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';
import 'package:amor/utils/functions.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:google_fonts/google_fonts.dart';

import 'experience_section.dart';

class ExperienceData {
  ExperienceData({
    required this.title,
    required this.titleUrl,
    required this.subtitle,
    required this.body,
    required this.location,
    required this.duration,
  });

  final String title;
  final String titleUrl;
  final String location;
  final String duration;
  final String subtitle;
  final List<String> body;
}

class ExperienceTree extends StatelessWidget {
  ExperienceTree({
    required this.experienceData,
    required this.headTitle,
    required this.tailTitle,
    this.head,
    this.widthOfTree = 200,
    this.headTitleStyle,
    this.tailTitleStyle,
    this.tail,
    this.headBackgroundColor,
    this.tailBackgroundColor,
    this.leftLeafTitleStyle,
    this.leftLeafSubtitleStyle,
    this.leftLeafSubtitleIcon,
    this.leftLeafTitleIcon,
    this.leftLeafIconColor,
    this.rightLeafTitleStyle,
    this.rightLeafSubtitleStyle,
    this.rightLeafBodyStyle,
    this.veinsColor,
    this.outerJointColor,
    this.innerJointColor,
  });

  final Widget? head;
  final double widthOfTree;
  final String headTitle;
  final String tailTitle;
  final TextStyle? headTitleStyle;
  final TextStyle? tailTitleStyle;
  final Color? headBackgroundColor;
  final Color? tailBackgroundColor;
  final Widget? tail;
  final List<ExperienceData> experienceData;
  final TextStyle? leftLeafTitleStyle;
  final TextStyle? leftLeafSubtitleStyle;
  final TextStyle? rightLeafTitleStyle;
  final TextStyle? rightLeafBodyStyle;
  final TextStyle? rightLeafSubtitleStyle;
  final Icon? leftLeafTitleIcon;
  final Icon? leftLeafSubtitleIcon;
  final Color? leftLeafIconColor;
  final Color? veinsColor;
  final Color? outerJointColor;
  final Color? innerJointColor;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.PADDING_16,
                vertical: Sizes.PADDING_8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.RADIUS_20),
                color: headBackgroundColor ?? AppColors.accentColor100,
              ),
              child: SelectableText(
                headTitle,
                style: headTitleStyle ??
                    textTheme.subtitle1?.copyWith(
                      color: AppColors.purple50,
                      fontSize: Sizes.TEXT_SIZE_16,
                    ),
              ),
            ),
          ),
          Column(
            children: _buildExperienceBranches(
              context: context,
              experienceData: experienceData,
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.PADDING_16,
                vertical: Sizes.PADDING_8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.RADIUS_20),
                color: tailBackgroundColor ?? AppColors.accentColor100,
              ),
              child: SelectableText(
                tailTitle,
                style: tailTitleStyle ??
                    textTheme.subtitle1?.copyWith(
                      color: AppColors.purple50,
                      fontSize: Sizes.TEXT_SIZE_16,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildExperienceBranches({
    required BuildContext context,
    required List<ExperienceData> experienceData,
  }) {
    List<Widget> branchWidgets = [];
    for (var index = 0; index < experienceData.length; index++) {
      branchWidgets.add(
        ExperienceBranch(
          leftLeafTitle: experienceData[index].duration,
          leftLeafSubtitle: experienceData[index].location,
          rightLeafTitle: experienceData[index].title,
          rightLeafTitleUrl: experienceData[index].titleUrl,
          rightLeafSubtitle: experienceData[index].subtitle,
          rightLeafBody: experienceData[index].body,
          leftLeafTitleStyle: leftLeafTitleStyle,
          leftLeafSubtitleStyle: leftLeafSubtitleStyle,
          rightLeafTitleStyle: rightLeafTitleStyle,
          rightLeafSubtitleStyle: rightLeafSubtitleStyle,
          rightLeafBodyStyle: rightLeafBodyStyle,
          width: widthOfTree,
          height: isDisplaySmallDesktop(context)
              ? assignHeight(context, 0.45)
              : assignHeight(context, 0.35),
          veinsColor: veinsColor,
          innerJointColor: innerJointColor,
          outerJointColor: outerJointColor,
          leftLeafTitleIcon: leftLeafTitleIcon,
          leftLeafSubtitleIcon: leftLeafSubtitleIcon,
          leftLeafIconColor: leftLeafIconColor,
        ),
      );
    }

    return branchWidgets;
  }
}

class ExperienceBranch extends StatefulWidget {
  ExperienceBranch({
    required this.leftLeafTitle,
    required this.leftLeafSubtitle,
    this.leftLeafTitleIcon,
    this.leftLeafSubtitleIcon,
    this.leftLeafIconColor,
    required this.rightLeafTitle,
    required this.rightLeafSubtitle,
    required this.rightLeafBody,
    required this.rightLeafTitleUrl,
    this.leftLeafTitleStyle,
    this.leftLeafSubtitleStyle,
    this.rightLeafTitleStyle,
    this.rightLeafSubtitleStyle,
    this.rightLeafBodyStyle,
    this.width = 200,
    this.height = 200,
    this.customPainter,
    this.stalk = 0.1,
    this.veinsColor = AppColors.accentColor100,
    this.outerJointColor = AppColors.accentColor100,
    this.innerJointColor = AppColors.purple600,
  });

  final double width;
  final double stalk;
  final double height;
  final String leftLeafTitle;
  final String leftLeafSubtitle;
  final String rightLeafTitle;
  final String rightLeafTitleUrl;
  final String rightLeafSubtitle;
  final List<String> rightLeafBody;
  final TextStyle? leftLeafTitleStyle;
  final TextStyle? leftLeafSubtitleStyle;
  final TextStyle? rightLeafTitleStyle;
  final TextStyle? rightLeafBodyStyle;
  final TextStyle? rightLeafSubtitleStyle;
  final Icon? leftLeafTitleIcon;
  final Icon? leftLeafSubtitleIcon;
  final Color? leftLeafIconColor;
  final CustomPainter? customPainter;
  final Color? veinsColor;
  final Color? outerJointColor;
  final Color? innerJointColor;

  @override
  _ExperienceBranchState createState() => _ExperienceBranchState();
}

class _ExperienceBranchState extends State<ExperienceBranch> {
  GlobalKey bodyLeafKey = GlobalKey();
  GlobalKey locationLeafKey = GlobalKey();
  double offsetRoleLeaf = 0.0;
  double offsetLocationLeaf = 0.0;

  @override
  void initState() {
    offsetRoleLeaf = (widget.height / 5) - 10;
    offsetLocationLeaf = (widget.height / 2) - 16;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getHeightOfRoleLeaf();
    });
    super.initState();
  }

  _getHeightOfRoleLeaf() {
    final RenderBox roleLeafRenderBox =
        bodyLeafKey.currentContext?.findRenderObject() as RenderBox;
    final RenderBox locationLeafRenderBox =
        locationLeafKey.currentContext?.findRenderObject() as RenderBox;

    final roleLeafHeight = roleLeafRenderBox.size.height;
    final locationLeafHeight = locationLeafRenderBox.size.height;
    setState(() {
      offsetRoleLeaf = (widget.height / 2) - (roleLeafHeight / 2);
      offsetLocationLeaf = (widget.height / 2) - (locationLeafHeight / 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: widget.customPainter ??
          TreePainter(
            stalk: 0.1,
            veinsColor: widget.veinsColor ?? AppColors.accentColor100,
            innerJointColor: widget.innerJointColor ?? AppColors.purple600,
            outerJointColor: widget.outerJointColor ?? AppColors.accentColor100,
          ),
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            Positioned(
              width: widget.width / 2,
              top: offsetLocationLeaf,
              left: 0,
              child: Container(
                key: locationLeafKey,
                padding: EdgeInsets.only(right: (widget.width * widget.stalk)),
                child: LeftLeaf(
                  title: widget.leftLeafTitle,
                  titleIcon: widget.leftLeafTitleIcon,
                  subtitle: widget.leftLeafSubtitle,
                  subtitleIcon: widget.leftLeafSubtitleIcon,
                  titleTextStyle: widget.leftLeafTitleStyle,
                  subtitleTextStyle: widget.leftLeafSubtitleStyle,
                ),
              ),
            ),
            SpaceH8(),
            Positioned(
              width: widget.width / 2,
              top: offsetRoleLeaf,
              right: 0,
              child: SingleChildScrollView(
                child: Container(
                  key: bodyLeafKey,
                  padding: EdgeInsets.only(
                    left: (widget.width * widget.stalk),
                  ),
                  child: RightLeaf(
                    title: widget.rightLeafTitle,
                    titleTextStyle: widget.rightLeafTitleStyle,
                    onTap: () {
                      openUrlLink(widget.rightLeafTitleUrl);
                    },
                    subtitle: widget.rightLeafSubtitle,
                    subtitleTextStyle: widget.rightLeafSubtitleStyle,
                    body: widget.rightLeafBody,
                    bodyTextStyle: widget.rightLeafBodyStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LeftLeaf extends StatelessWidget {
  LeftLeaf({
    required this.title,
    required this.subtitle,
    this.titleIcon,
    this.subtitleIcon,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.defaultIconColor = AppColors.darkGrey100,
  });

  final String title;
  final String subtitle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? titleTextStyle;
  final Icon? subtitleIcon;
  final Icon? titleIcon;
  final Color? defaultIconColor;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SelectableText(
                title,
                style: titleTextStyle ??
                    textTheme.bodyText2?.copyWith(
                      color: AppColors.darkGrey100,
                      fontSize: Sizes.TEXT_SIZE_12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SpaceW4(),
              titleIcon ??
                  Icon(
                    Icons.access_time,
                    color: AppColors.darkGrey100,
                    size: Sizes.ICON_SIZE_18,
                  ),
            ],
          ),
          SpaceH8(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SelectableText(
                subtitle,
                style: subtitleTextStyle ??
                    textTheme.bodyText2?.copyWith(
                      color: defaultIconColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SpaceW4(),
              subtitleIcon ??
                  Icon(
                    Icons.location_on,
                    color: defaultIconColor,
                    size: Sizes.ICON_SIZE_18,
                  ),
            ],
          )
        ],
      ),
    );
  }
}

class RightLeaf extends StatelessWidget {
  RightLeaf({
    required this.title,
    required this.subtitle,
    required this.body,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.bodyTextStyle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final List<String> body;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? bodyTextStyle;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Text(
              title,
              style: titleTextStyle ??
                  Styles.customTextStyle(
                    fontSize: Sizes.TEXT_SIZE_18,
                    fontStyle: FontStyle.normal,
                  ),
            ),
          ),
          SelectableText(
            subtitle,
            style: subtitleTextStyle ??
                Styles.customTextStyle(
                  fontStyle: FontStyle.italic,
                ),
          ),
          SpaceH8(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildBody(body: body, context: context),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBody({
    required List<String> body,
    required BuildContext context,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> bodyWidgets = [];
    for (var index = 0; index < body.length; index++) {
      bodyWidgets.add(
        Body(
          body: body[index],
          bodyTextStyle: bodyTextStyle ??
              textTheme.bodyText2?.copyWith(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
          color: AppColors.darkGrey300,
        ),
      );
      bodyWidgets.add(SpaceH8());
    }

    return bodyWidgets;
  }
}
