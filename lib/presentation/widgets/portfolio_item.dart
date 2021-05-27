import 'package:amor/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';

class PortfolioData {
  final String imageUrl;
  final String title;

  const PortfolioData({
    required this.imageUrl,
    required this.title,
  });
}

class PortfolioItem extends StatelessWidget {
  final String portfolioTitle;
  final String imageUrl;
  final double? width;
  final double? height;
  final TextStyle? portfolioTitleStyle;

  PortfolioItem({
    this.width,
    this.height,
    required this.imageUrl,
    required this.portfolioTitle,
    this.portfolioTitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            imageUrl,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
        SpaceH8(),
        Text(
          portfolioTitle,
          style: portfolioTitleStyle ?? textTheme.subtitle1,
        ),
      ],
    );
  }
}
