import 'package:flutter/material.dart';
import 'package:amor/presentation/widgets/spaces.dart';

import 'package:amor/presentation/widgets/horizontal_bar.dart';
import 'package:amor/values/values.dart';

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class CertificationCard extends StatefulWidget {
  CertificationCard({
    this.width = 500,
    this.height = 400,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.actionTitle = "",
    this.hasActionTitle = false,
    this.hoverColor = AppColors.primaryColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.actionTitleTextStyle,
    this.border,
    this.boxShadow = const [Shadows.elevationShadow],
    this.duration = 1000,
    this.onTap,
  });

  final double width;
  final double height;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String actionTitle;
  final List<BoxShadow> boxShadow;
  final BoxBorder? border;
  final Color hoverColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? actionTitleTextStyle;
  final int duration;
  final bool hasActionTitle;
  final GestureTapCallback? onTap;

  @override
  _CertificationCardState createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard>
    with TickerProviderStateMixin {
  late AnimationController _portfolioCoverController;
  late Animation<double> _opacityAnimation;
  final int duration = 400;
  bool _hovering = false;

  @override
  void initState() {
    _portfolioCoverController = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    initTweens();

    super.initState();
  }

  @override
  void dispose() {
    _portfolioCoverController.dispose();
    super.dispose();
  }

  void initTweens() {
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: _portfolioCoverController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  Future<void> _playPortfolioCoverAnimation() async {
    try {
      await _portfolioCoverController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          boxShadow: widget.boxShadow,
          border: widget.border,
        ),
        child: MouseRegion(
          onEnter: (e) => _mouseEnter(true),
          onExit: (e) => _mouseEnter(false),
          child: Stack(
            children: [
              Image.asset(
                widget.imageUrl,
                width: widget.width,
                height: widget.height,
                fit: BoxFit.cover,
              ),
              _hovering
                  ? FadeTransition(
                      opacity: _opacityAnimation,
                      child: Container(
                        width: widget.width,
                        height: widget.height,
                        color: widget.hoverColor,
                        child: Column(
                          children: [
                            Spacer(flex: 1),
                            SelectableText(
                              widget.title,
                              textAlign: TextAlign.center,
                              style: widget.titleTextStyle ??
                                  textTheme.headline4?.copyWith(
                                    color: AppColors.white,
                                  ),
                            ),
                            SpaceH4(),
                            SelectableText(
                              widget.subtitle,
                              textAlign: TextAlign.center,
                              style: widget.subtitleTextStyle ??
                                  textTheme.bodyText1?.copyWith(
                                    color: AppColors.white,
                                    fontSize: Sizes.textSize_16,
                                  ),
                            ),
                            SpaceH16(),
                            widget.hasActionTitle
                                ? SelectableText(
                                    widget.actionTitle,
                                    textAlign: TextAlign.center,
                                    style: widget.actionTitleTextStyle ??
                                        textTheme.subtitle1?.copyWith(
                                          color: AppColors.secondaryColor,
                                        ),
                                  )
                                : Container(),
                            SpaceH4(),
                            HorizontalBar(color: AppColors.secondaryColor),
                            Spacer(flex: 1),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });

    if (_hovering == true) {
      _playPortfolioCoverAnimation();
    } else if (_hovering == false) {
      _portfolioCoverController.reverse().orCancel;
    }
  }
}
