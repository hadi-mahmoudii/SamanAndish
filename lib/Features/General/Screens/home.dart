import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/home_banner.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Widgets/five_navigation_button.dart';
import '../../../Core/Widgets/global_appbar.dart';
import '../../../Core/Widgets/loading_widget.dart';
import '../../../Core/Widgets/simple_header.dart';
import '../Providers/home.dart';
import '../Widgets/home_banner.dart';
import '../Widgets/home_blogs.dart';
import '../Widgets/home_category.dart';
import '../Widgets/home_slider.dart';
import '../Widgets/home_special_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (ctx) => HomeProvider(),
      child: const HomeScreenTile(),
    );
  }
}

class HomeScreenTile extends StatefulWidget {
  const HomeScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenTileState createState() => _HomeScreenTileState();
}

class _HomeScreenTileState extends State<HomeScreenTile> {
  @override
  initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<HomeProvider>(context, listen: false).initApp(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context).textTheme;
    return Consumer<HomeProvider>(
      builder: (ctx, provider, _) => Scaffold(
        bottomNavigationBar: const BottomNavigationButtons(
          curIndex: 3,
          mainFontColor: mainFontColor,
        ),
        appBar: const GlobalAppBar(
          eLabel: 'HOME',
          pLabel: 'خانه',
          letReturn: false,
        ).build(context),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    provider.sliders.isNotEmpty
                        ? HomeHeaderImagesBox(banners: provider.sliders)
                        : Container(),
                    provider.categories.isNotEmpty
                        ? Container(
                            margin: const EdgeInsets.only(top: 30, bottom: 10),
                            padding: const EdgeInsets.only(top: 18, bottom: 14),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color:
                                      const Color(0xFF2D3B63).withOpacity(.3),
                                ),
                              ),
                            ),
                            child: const SimpleHeader(
                                persian: 'دسته بندی ها', english: 'CATEGORIES'),
                          )
                        : Container(),
                    provider.categories.isNotEmpty
                        ? Directionality(
                            textDirection: TextDirection.rtl,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    provider.categories[0].size == 'horizontal'
                                        ? 2
                                        : 4,
                                childAspectRatio:
                                    provider.categories[0].size == 'horizontal'
                                        ? 4 / 2
                                        : 1,
                              ),
                              itemBuilder: (ctx, ind) => HomeCategoryWidget(
                                category: provider.categories[ind],
                              ),
                              itemCount: provider.categories.length,
                            ),
                          )
                        : Container(),
                    provider.products.isNotEmpty
                        ? Container(
                            margin: const EdgeInsets.only(top: 45),
                            padding: const EdgeInsets.only(top: 30, bottom: 15),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color:
                                      const Color(0xFF2D3B63).withOpacity(.3),
                                ),
                              ),
                            ),
                            child: const SimpleHeader(
                              persian: 'جدیدترین محصولات',
                              english: 'LATEST PRODuCTS',
                            ),
                          )
                        : Container(),
                    HomeSpecialCategoriesWidget(
                      themeData: themeData,
                      categories: provider.products,
                    ),
                    provider.banners.isNotEmpty
                        ? Container(
                            margin: const EdgeInsets.only(top: 45),
                            padding: const EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color:
                                      const Color(0xFF2D3B63).withOpacity(.3),
                                ),
                              ),
                            ),
                            child: Wrap(
                              runSpacing: 2.5,
                              spacing: 2.5,
                              textDirection: TextDirection.rtl,
                              runAlignment: WrapAlignment.spaceBetween,
                              children: [
                                for (HomeBannerModel banner in provider.banners)
                                  HomeBannerWidget(banner: banner),
                              ],
                            ),
                          )
                        : Container(),
                    // provider.banners.isNotEmpty
                    //     ? Container(
                    //         margin: const EdgeInsets.only(top: 45),
                    //         padding: const EdgeInsets.only(top: 40),
                    //         decoration: BoxDecoration(
                    //           border: Border(
                    //             top: BorderSide(
                    //               color:
                    //                   const Color(0xFF2D3B63).withOpacity(.3),
                    //             ),
                    //           ),
                    //         ),
                    //         child: Directionality(
                    //           textDirection: TextDirection.rtl,
                    //           child: GridView.builder(
                    //             shrinkWrap: true,
                    //             physics: const NeverScrollableScrollPhysics(),
                    //             gridDelegate:
                    //                 const SliverGridDelegateWithFixedCrossAxisCount(
                    //               crossAxisCount: 2,
                    //               childAspectRatio: 3 / 2,
                    //               crossAxisSpacing: 2,
                    //             ),
                    //             itemBuilder: (ctx, ind) => HomeBannerWidget(
                    //               banner: provider.banners[ind],
                    //             ),
                    //             itemCount: provider.banners.length,
                    //           ),
                    //         ),
                    //       )
                    //     : Container(),
                    // provider.largeBanners.isNotEmpty
                    //     ? Container(
                    //         padding: const EdgeInsets.only(top: 2),
                    //         child: ListView.separated(
                    //           shrinkWrap: true,
                    //           physics: const NeverScrollableScrollPhysics(),
                    //           itemBuilder: (ctx, ind) => AspectRatio(
                    //             aspectRatio: 3,
                    //             child: HomeBannerWidget(
                    //               banner: provider.largeBanners[ind],
                    //             ),
                    //           ),
                    //           separatorBuilder: (ctx, ind) =>
                    //               const SizedBox(height: 2),
                    //           itemCount: provider.largeBanners.length,
                    //         ),
                    //       )
                    //     : Container(),
                    provider.blogs.isNotEmpty
                        ? Container(
                            margin: const EdgeInsets.only(top: 55, bottom: 16),
                            // padding: const EdgeInsets.only(top: 30),
                            // decoration: BoxDecoration(
                            //   border: Border(
                            //     top: BorderSide(
                            //       color:
                            //           const Color(0xFF2D3B63).withOpacity(.3),
                            //     ),
                            //   ),
                            // ),
                            child: const SimpleHeader(
                              persian: 'جدیدترین اخبار',
                              english: 'LATEST NEWS',
                            ),
                          )
                        : Container(),
                    HomeBlogsWidget(
                      themeData: themeData,
                      blogs: provider.blogs,
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
      ),
    );
  }
}
