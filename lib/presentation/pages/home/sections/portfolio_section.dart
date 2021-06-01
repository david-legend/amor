import 'package:amor/presentation/layout/adaptive.dart';
import 'package:amor/presentation/widgets/portfolio_item.dart';
import 'package:amor/presentation/widgets/section_title.dart';
import 'package:amor/presentation/widgets/spaces.dart';
import 'package:amor/values/values.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:layout/layout.dart';

const double kMainAxisSpacing = 60.0;
const double kCrossAxisSpacing = 30.0;
const double portfolioItemHeight1 = 400;
const double portfolioItemHeight2 = 200;
const double bigScreenTabHeight =
    (portfolioItemHeight1 * 2) + (kMainAxisSpacing * 2);
const double smallScreenTabHeight =
    (portfolioItemHeight2 * 4) + (kMainAxisSpacing * 4);

class PortfolioSection extends StatefulWidget {
  @override
  _PortfolioSectionState createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
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

    double tabHeight = context.layout.value(
      xs: smallScreenTabHeight,
      sm: smallScreenTabHeight,
      md: bigScreenTabHeight,
      lg: bigScreenTabHeight,
      xl: bigScreenTabHeight,
    );
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
                if (sizingInformation.screenSize.width >
                    RefinedBreakpoints().tabletLarge) {
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
                    width: double.infinity,
                    child: TabBar(
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
                    ),
                  );
                }
              },
            ),
            SpaceH20(),
            SizedBox(
              height: tabHeight,
              child: TabBarView(
                children: [
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
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.screenSize.width <=
          RefinedBreakpoints().tabletLarge) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_16),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: data.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return PortfolioItem(
                imageUrl: data[index].imageUrl,
                portfolioTitle: data[index].title,
              );
            },
            staggeredTileBuilder: (int index) {
              return StaggeredTile.extent(2, portfolioItemHeight2);
            },
            mainAxisSpacing: kMainAxisSpacing,
            crossAxisSpacing: kCrossAxisSpacing,
          ),
        );
      } else {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_16),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 3,
            itemCount: data.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return PortfolioItem(
                imageUrl: data[index].imageUrl,
                portfolioTitle: data[index].title,
              );
            },
            staggeredTileBuilder: (int index) {
              if (index == 1 || index == 5) {
                return StaggeredTile.extent(1, portfolioItemHeight1);
              } else {
                return StaggeredTile.extent(1, portfolioItemHeight2);
              }
            },
            mainAxisSpacing: kMainAxisSpacing,
            crossAxisSpacing: kCrossAxisSpacing,
          ),
        );
      }
    });
  }
}
