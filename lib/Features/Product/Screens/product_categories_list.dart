import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Widgets/five_navigation_button.dart';
import '../../../Core/Widgets/global_appbar.dart';
import '../../../Core/Widgets/loading_widget.dart';
import '../Models/category.dart';
import '../Providers/product_categories_list.dart';
import '../Widgets/Category_navigation_box.dart';

class ProductCategoriesListScreen extends StatelessWidget {
  const ProductCategoriesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductCategoriesListProvider>(
      create: (ctx) => ProductCategoriesListProvider(
          ModalRoute.of(context)!.settings.arguments as CategoryModel),
      child: const ProductCategoriesListScreenTile(),
    );
  }
}

class ProductCategoriesListScreenTile extends StatefulWidget {
  const ProductCategoriesListScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _ProductCategoriesListScreenTileState createState() =>
      _ProductCategoriesListScreenTileState();
}

class _ProductCategoriesListScreenTileState
    extends State<ProductCategoriesListScreenTile> {
  @override
  initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<ProductCategoriesListProvider>(context, listen: false)
          .getDatas(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context).textTheme;
    return Consumer<ProductCategoriesListProvider>(
      builder: (ctx, provider, _) => Scaffold(
        appBar: GlobalAppBar(
          eLabel: provider.parentCategory.nameE,
          pLabel: provider.parentCategory.name,
        ).build(context),
        bottomNavigationBar: const BottomNavigationButtons(
          curIndex: 2,
          mainFontColor: mainFontColor,
        ),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : NotificationListener(
                // onNotification: (ScrollNotification notification) {
                //   if (notification is ScrollUpdateNotification) {
                //     if (provider.scrollController.position.pixels >
                //             provider.scrollController.position
                //                     .maxScrollExtent -
                //                 30 &&
                //         provider.isLoadingMore) {}
                //   }
                //   return true;
                // },
                child: RefreshIndicator(
                  onRefresh: () async =>
                      provider.getDatas(context, resetPage: true),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      children: [
                        const SizedBox(height: 20),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) => CategoryNavigationBox(
                            category: provider.categories[index],
                            themeData: themeData,
                          ),
                          separatorBuilder: (ctx, ind) => const Divider(
                            height: 10,
                          ),
                          itemCount: provider.categories.length,
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
