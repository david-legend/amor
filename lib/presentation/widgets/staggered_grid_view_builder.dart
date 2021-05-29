import 'package:amor/presentation/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

enum _StaggeredGridViewMode { count, extent }

const EdgeInsetsGeometry padding = EdgeInsets.symmetric(horizontal: 4);

class StaggeredGridViewBuilder extends StatelessWidget {
  final String title;
  final List<StaggeredTile> tiles;
  final int? crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double? maxCrossAxisExtent;
  final _StaggeredGridViewMode _staggeredGridViewMode;

  const StaggeredGridViewBuilder.count({
    required this.title,
    required this.crossAxisCount,
    required this.tiles,
    this.mainAxisSpacing = 4,
    this.crossAxisSpacing = 4,
  })  : _staggeredGridViewMode = _StaggeredGridViewMode.count,
        maxCrossAxisExtent = null;

  const StaggeredGridViewBuilder.extent({
    required this.title,
    required this.maxCrossAxisExtent,
    required this.tiles,
    this.mainAxisSpacing = 4,
    this.crossAxisSpacing = 4,
  })  : _staggeredGridViewMode = _StaggeredGridViewMode.extent,
        crossAxisCount = null;

  @override
  Widget build(BuildContext context) {
    switch (_staggeredGridViewMode) {
      case _StaggeredGridViewMode.count:
        return StaggeredGridView.countBuilder(
          crossAxisCount: crossAxisCount!,
          itemCount: tiles.length,
          itemBuilder: _getChild,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          padding: padding,
          staggeredTileBuilder: _getStaggeredTile,
        );
      default:
        return StaggeredGridView.extentBuilder(
          maxCrossAxisExtent: maxCrossAxisExtent!,
          itemCount: tiles.length,
          itemBuilder: _getChild,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          padding: padding,
          staggeredTileBuilder: _getStaggeredTile,
        );
    }
  }

  StaggeredTile? _getStaggeredTile(int i) {
    return i >= tiles.length ? null : tiles[i];
  }

  TileWidget _getChild(BuildContext context, int index) {
    double height = index.isEven ? 300 : 500;
    return TileWidget(
      key: ObjectKey(index),
      index: index,
      height: height,
    );
  }
}
