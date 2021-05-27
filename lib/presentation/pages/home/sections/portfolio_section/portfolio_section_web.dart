import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/portfolio_item.dart';
import 'package:amor/presentation/widgets/section_title.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

int dataLength = Data.portfolioData.length;
const double kMainAxisSpacing = 4.0;
const double kCrossAxisSpacing = 4.0;
const int portfolioItemHeight = 250;

class PortfolioSectionWeb extends StatelessWidget {
  final List<String> tabs = [
    StringConst.GRAPHICS,
    StringConst.APP_DESIGN,
    StringConst.BRANDING,
    StringConst.GAME_DESIGN,
    StringConst.WEB_DESIGN,
    StringConst.ALL,
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = widthOfScreen(context);
    TextStyle? labelTextStyle = textTheme.bodyText1?.copyWith();
    return DefaultTabController(
      length: tabs.length,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: StringConst.PORTFOLIO,
            ),
            SpaceH40(),
            ResponsiveBuilder(
              builder: (context, sizingInformation) {
                if (sizingInformation.isMobile) {
                  return TabBar(
                    labelStyle: labelTextStyle,
                    unselectedLabelStyle: labelTextStyle,
                    labelColor: AppColors.accentColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: AppColors.darkGrey600,
                    overlayColor: MaterialStateProperty.all(Colors.white),
                    isScrollable: true,
                    indicator: BubbleTabIndicator(
                      indicatorHeight: Sizes.HEIGHT_44,
                      indicatorColor: AppColors.purple700,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      insets: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                    ),
                    tabs: _buildTabs(tabs),
                  );
                } else {
                  return Container(
                    width: screenWidth * 0.7,
                    child: TabBar(
                      labelStyle: labelTextStyle,
                      unselectedLabelStyle: labelTextStyle,
                      labelColor: AppColors.accentColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: AppColors.darkGrey600,
                      overlayColor: MaterialStateProperty.all(Colors.white),
                      isScrollable: false,
                      indicator: BubbleTabIndicator(
                        indicatorHeight: Sizes.HEIGHT_44,
                        indicatorColor: AppColors.purple700,
                        tabBarIndicatorSize: TabBarIndicatorSize.tab,
                        insets: EdgeInsets.symmetric(
                          horizontal: Sizes.PADDING_16,
                          vertical: Sizes.PADDING_0,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      tabs: _buildTabs(tabs),
                    ),
                  );
                }
              },
            ),

            Container(
              height: 200,
              child: TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                  Icon(Icons.directions_bike),
                  Icon(Icons.directions_bike),
                  Icon(Icons.directions_bike),
                ],
              ),
            )
//          Container(
//            height: 100,
//            width: screenWidth,
////            (portfolioItemHeight * dataLength) +
////                (kCrossAxisSpacing * dataLength),
//            child: StaggeredGridView.countBuilder(
//              crossAxisCount: 3,
//              itemCount: dataLength,
//              physics: NeverScrollableScrollPhysics(),
//              itemBuilder: (BuildContext context, int index) {
//                return Container(
//                  color: Colors.amber,
//                  height: 100,
//                  child: PortfolioItem(
//                    imageUrl: Data.portfolioData[index].imageUrl,
//                    portfolioTitle: Data.portfolioData[index].title,
//                    height: 100,
//                    width: 100,
//                  ),
//                );
//              },
//              staggeredTileBuilder: (int index) =>
//                  new StaggeredTile.count(3, index.isEven ? 2 : 1),
//              mainAxisSpacing: kMainAxisSpacing,
//              crossAxisSpacing: kCrossAxisSpacing,
//            ),
//          ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTabs(List<String> tabs) {
    List<Widget> tabsItems = [];

    for (int index = 0; index < tabs.length; index++) {
      tabsItems.add(
        Tab(text: tabs[index]),
      );
    }

    return tabsItems;
  }
}
