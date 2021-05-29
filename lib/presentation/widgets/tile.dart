import 'package:amor/presentation/widgets/portfolio_item.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({
    Key? key,
    required this.index,
    this.width = 300,
    this.height = 300,
    this.backgroundColor = Colors.green,
  }) : super(key: key);

  final int index;
  final double width;
  final double height;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
//    return Container(
//      color: backgroundColor,
//      child: Center(
//          child: CircleAvatar(
//        backgroundColor: Colors.white,
//        child: Text('$index'),
//      )),
//    );

    return PortfolioItem(
      imageUrl: ImagePath.art_1,
      portfolioTitle: StringConst.PORTFOLIO,
      width: width,
      height: height,
//            width: screenWidth * data[index].width,
    );
  }
}
