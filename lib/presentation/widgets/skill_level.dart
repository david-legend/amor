import 'package:flutter/material.dart';

import 'package:amor/presentation/widgets/skill_progress_painter.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';

class SkillLevel extends StatelessWidget {
  SkillLevel({
    required this.skillLevel,
    required this.skillName,
    this.width = 100,
    this.circleWidth = 80, //Sizes.WIDTH_60,
    this.circleHeight = 80, //Sizes.HEIGHT_60,
    this.skillLevelStyle,
    this.skillNameTextStyle,
    this.duration = const Duration(milliseconds: 500),
    this.progressColor = AppColors.purple500,
    this.baseColor = AppColors.accentColor50,
  });

  final double skillLevel;
  final String skillName;
  final TextStyle? skillLevelStyle;
  final TextStyle? skillNameTextStyle;
  final double width;
  final double circleWidth;
  final double circleHeight;
  final Duration duration;
  final Color progressColor;
  final Color baseColor;

  @override
  Widget build(BuildContext context) {
    var actualSkillLevel = skillLevel;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: width,
      height: 100,
      child: Column(
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: skillLevel),
            duration: duration,
            child: Container(
              width: circleWidth,
              height: circleHeight,
              child: Center(
                child: Text(
                  "$actualSkillLevel%",
                  style: skillLevelStyle ??
                      textTheme.subtitle1?.copyWith(
                        color: AppColors.purple50,
                      ),
                ),
              ),
            ),
            builder: (
              BuildContext context,
              double value,
              Widget? child,
            ) {
              return CustomPaint(
                foregroundPainter: SkillProgressPainter(
                  currentProgress: value,
                  circleColor: baseColor,
                  progressArcColor: progressColor,
                ),
                child: AnimatedOpacity(
                  opacity: value / 100,
                  duration: duration,
                  child: child,
                ),
              );
            },
          ),
          SpaceW8(),
          Expanded(
            child: Text(
              skillName,
              style: skillNameTextStyle ??
                  textTheme.subtitle2?.copyWith(
                    color: AppColors.darkGrey600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
