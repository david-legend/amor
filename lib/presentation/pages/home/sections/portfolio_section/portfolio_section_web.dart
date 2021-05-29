import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/portfolio_item.dart';
import 'package:amor/presentation/widgets/section_title.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

const double kMainAxisSpacing = 8.0;
const double kCrossAxisSpacing = 8.0;
const int portfolioItemHeight = 250;

class PortfolioSectionWeb extends StatefulWidget {
  @override
  _PortfolioSectionWebState createState() => _PortfolioSectionWebState();
}

class _PortfolioSectionWebState extends State<PortfolioSectionWeb> {
  final List<String> tabs = [
    StringConst.GRAPHICS,
    StringConst.APP_DESIGN,
    StringConst.BRANDING,
    StringConst.GAME_DESIGN,
    StringConst.WEB_DESIGN,
    StringConst.ALL,
  ];
  List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
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
              height: 800,
              child: TabBarView(
                children: [
//                  StaggeredGridView.count(
//                    primary: false,
//                    crossAxisCount: 4,
//                    mainAxisSpacing: 4,
//                    crossAxisSpacing: 4,
//                    staggeredTiles: const <StaggeredTile>[
//                      StaggeredTile.count(2, 2),
//                      StaggeredTile.count(2, 1),
//                      StaggeredTile.count(2, 2),
//                      StaggeredTile.count(2, 1),
//                      StaggeredTile.count(2, 2),
//                      StaggeredTile.count(2, 1),
//                      StaggeredTile.count(2, 2),
//                      StaggeredTile.count(2, 1),
//                    ],
//                    children: const <Widget>[
//                      Text('1'),
//                      Text('2'),
//                      Text('3'),
//                      Text('4'),
//                      Text('5'),
//                      Text('6'),
//                      Text('7'),
//                      Text('8'),
//                    ],
//                  ),

                  _buildPortfolioContent(Data.portfolioData),
                  _buildPortfolioContent(Data.portfolioData),
                  _buildPortfolioContent(Data.portfolioData),
                  _buildPortfolioContent(Data.portfolioData),
                  _buildPortfolioContent(Data.portfolioData),
                  _buildPortfolioContent(Data.portfolioData),
                ],
              ),
            ),
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

  Widget _buildPortfolioContent(List<PortfolioData> data) {
    double screenWidth = widthOfScreen(context);
//    return StaggeredGridView.countBuilder(
//      crossAxisCount: 4,
//      itemCount: 8,
//      itemBuilder: (BuildContext context, int index) => new Container(
//        color: Colors.green,
//        child: new Center(
//          child: new CircleAvatar(
//            backgroundColor: Colors.white,
//            child: new Text('$index'),
//          ),
//        ),
//      ),
//      staggeredTileBuilder: (int index) =>
//          new StaggeredTile.count(2, index.isEven ? 2 : 1),
//      mainAxisSpacing: 4.0,
//      crossAxisSpacing: 4.0,
//    );
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: data.length,
      shrinkWrap: true,
//      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.amber,
//          width: screenWidth * data[index].width,
          height: 100,
          child: PortfolioItem(
            imageUrl: data[index].imageUrl,
            portfolioTitle: data[index].title,
            height: 150,
//            width: screenWidth * data[index].width,
          ),
        );
      },
      staggeredTileBuilder: (int index) {
        if (index == 1 || index == 5) {
          return StaggeredTile.count(1, 3);
//          return StaggeredTile.extent(1, 3);
//          return StaggeredTile.fit(2);
        } else {
//          return StaggeredTile.fit(1);
//          return StaggeredTile.extent(1, 2);
          return StaggeredTile.count(1, 2);
        }
      },
      mainAxisSpacing: kMainAxisSpacing,
      crossAxisSpacing: kCrossAxisSpacing,
    );
  }
}
