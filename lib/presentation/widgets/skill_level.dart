import 'package:flutter/material.dart';

import 'package:amor/presentation/widgets/skill_progress_painter.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SkillLevel extends StatelessWidget {
  SkillLevel({
    required this.skillLevel,
    required this.skillName,
    this.width = 120,
    this.height = 120,
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
  final double height;
  final Duration duration;
  final Color progressColor;
  final Color baseColor;

  @override
  Widget build(BuildContext context) {
    var actualSkillLevel = skillLevel;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: skillLevel),
            duration: duration,
            child: Container(
              width: width,
              height: height,
              child: Center(
                child: Text(
                  "$actualSkillLevel%",
                  style: skillLevelStyle ??
                      textTheme.subtitle1?.copyWith(
                        color: AppColors.purple500,
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
                  opacity: 1,
                  duration: duration,
                  child: child,
                ),
              );
            },
          ),
          SpaceH8(),
          Text(
            skillName,
            style: skillNameTextStyle ??
                textTheme.subtitle2?.copyWith(
                  fontSize: Sizes.TEXT_SIZE_16,
                  color: AppColors.darkGrey600,
                ),
          ),
        ],
      ),
    );
  }
}
