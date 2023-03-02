import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Widgets/global_appbar.dart';
import '../../../Core/Widgets/loading_widget.dart';
import '../Models/category.dart';
import '../Providers/product_list.dart';
import '../Widgets/product_item_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductListProvider>(
      create: (ctx) => ProductListProvider(
          ModalRoute.of(context)!.settings.arguments as CategoryModel),
      child: const ProductListScreenTile(),
    );
  }
}

class ProductListScreenTile extends StatefulWidget {
  const ProductListScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _ProductListScreenTileState createState() => _ProductListScreenTileState();
}

class _ProductListScreenTileState extends State<ProductListScreenTile> {
  @override
  initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<ProductListProvider>(context, listen: false)
          .getDatas(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context).textTheme;
    return Consumer<ProductListProvider>(
      builder: (ctx, provider, _) => Scaffold(
        appBar: GlobalAppBar(
          eLabel: provider.parentCategory.nameE,
          pLabel: provider.parentCategory.name,
        ).build(context),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : NotificationListener(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    if (provider.scrollController.position.pixels >
                            provider.scrollController.position.maxScrollExtent -
                                30 &&
                        !provider.isLoadingMore) {
                      provider.getDatas(context);
                    }
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: () async =>
                      provider.getDatas(context, resetPage: true),
                  child: ListView(
                    controller: provider.scrollController,
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        // height: User.deviceHeigth,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 5 / 6,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (ctx, ind) => ProductItemCard(
                            provider.products[ind],
                            themeData,
                          ),
                          itemCount: provider.products.length,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
