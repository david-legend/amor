//import 'package:amor/presentation/layout/adaptive.dart';
//import 'package:amor/presentation/widgets/portfolio_item.dart';
//import 'package:amor/values/values.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
//const List<StaggeredTile> _tiles = <StaggeredTile>[
////  StaggeredTile.extent(1, 50),
//  StaggeredTile.extent(1, 340),
//  StaggeredTile.extent(1, 600),
//  StaggeredTile.extent(1, 340),
//  StaggeredTile.extent(1, 600),
//  StaggeredTile.extent(1, 340),
//  StaggeredTile.extent(1, 600),
//  StaggeredTile.extent(1, 340),
//  StaggeredTile.extent(1, 600),
////  StaggeredTile.extent(1, 160),
////  StaggeredTile.extent(1, 140),
////  StaggeredTile.extent(1, 120),
////  StaggeredTile.extent(1, 130),
////  StaggeredTile.extent(1, 50),
////  StaggeredTile.extent(1, 60),
////  StaggeredTile.extent(1, 130),
////  StaggeredTile.extent(1, 140),
////  StaggeredTile.extent(1, 60),
////  StaggeredTile.extent(1, 150),
//];
//
//class StaggeredExtentExtentPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return StaggeredGridViewPage.extent(
//      title: 'Staggered (Extent, Extent)',
//      maxCrossAxisExtent: assignWidth(context, 0.3),
//      tiles: _tiles,
//    );
//  }
//}
//
//class TileWidget extends StatelessWidget {
//  const TileWidget({
//    Key? key,
//    required this.index,
//    this.width = 300,
//    this.height = 300,
//    this.backgroundColor = Colors.green,
//  }) : super(key: key);
//
//  final int index;
//  final double width;
//  final double height;
//  final Color backgroundColor;
//
//  @override
//  Widget build(BuildContext context) {
////    return Container(
////      color: backgroundColor,
////      child: Center(
////          child: CircleAvatar(
////        backgroundColor: Colors.white,
////        child: Text('$index'),
////      )),
////    );
//
//    return PortfolioItem(
//      imageUrl: ImagePath.art_1,
//      portfolioTitle: StringConst.PORTFOLIO,
//      width: width,
//      height: height,
////            width: screenWidth * data[index].width,
//    );
//  }
//}
//
//class StaggeredGridViewPage extends StatelessWidget {
//  const StaggeredGridViewPage.count({
//    required this.title,
//    required this.crossAxisCount,
//    required this.tiles,
//    this.mainAxisSpacing = 4,
//    this.crossAxisSpacing = 4,
//  })  : _staggeredGridViewMode = _StaggeredGridViewMode.count,
//        maxCrossAxisExtent = null;
//
//  const StaggeredGridViewPage.extent({
//    required this.title,
//    required this.maxCrossAxisExtent,
//    required this.tiles,
//    this.mainAxisSpacing = 4,
//    this.crossAxisSpacing = 4,
//  })  : _staggeredGridViewMode = _StaggeredGridViewMode.extent,
//        crossAxisCount = null;
//
//  static const EdgeInsetsGeometry padding = EdgeInsets.symmetric(horizontal: 4);
//
//  final String title;
//  final List<StaggeredTile> tiles;
//  final int? crossAxisCount;
//  final double mainAxisSpacing;
//  final double crossAxisSpacing;
//  final double? maxCrossAxisExtent;
//  final _StaggeredGridViewMode _staggeredGridViewMode;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text(title),
//        ),
//        body: Padding(
//            padding: const EdgeInsets.only(top: 4),
//            child: _buildStaggeredGridView(context)));
//  }
//
//  Widget _buildStaggeredGridView(BuildContext context) {
//    switch (_staggeredGridViewMode) {
//      case _StaggeredGridViewMode.count:
//        return StaggeredGridView.countBuilder(
//          crossAxisCount: crossAxisCount!,
//          itemCount: tiles.length,
//          itemBuilder: _getChild,
//          mainAxisSpacing: mainAxisSpacing,
//          crossAxisSpacing: crossAxisSpacing,
//          padding: padding,
//          staggeredTileBuilder: _getStaggeredTile,
//        );
//      default:
//        return StaggeredGridView.extentBuilder(
//          maxCrossAxisExtent: maxCrossAxisExtent!,
//          itemCount: tiles.length,
//          itemBuilder: _getChild,
//          mainAxisSpacing: mainAxisSpacing,
//          crossAxisSpacing: crossAxisSpacing,
//          padding: padding,
//          staggeredTileBuilder: _getStaggeredTile,
//        );
//    }
//  }
//
//  StaggeredTile? _getStaggeredTile(int i) {
//    return i >= tiles.length ? null : tiles[i];
//  }
//
//  TileWidget _getChild(BuildContext context, int index) {
//    double height = index.isEven ? 300 : 500;
//    return TileWidget(
//      key: ObjectKey(index),
//      index: index,
//      height: height,
//    );
//  }
//}
//
//enum _StaggeredGridViewMode { count, extent }
