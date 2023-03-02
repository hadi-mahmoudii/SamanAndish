import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Widgets/global_appbar.dart';
import '../../../Core/Widgets/loading_widget.dart';
import '../Models/product.dart';
import '../Providers/product_specification.dart';
import '../Widgets/product-details-table.dart';

class ProductSpecificationScreen extends StatelessWidget {
  const ProductSpecificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductSpecificationProvider>(
      create: (ctx) => ProductSpecificationProvider(
        ModalRoute.of(context)!.settings.arguments as ProductModel,
      ),
      child: const ProductSpecificationScreenTile(),
    );
  }
}

class ProductSpecificationScreenTile extends StatefulWidget {
  const ProductSpecificationScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _ProductSpecificationScreenTileState createState() =>
      _ProductSpecificationScreenTileState();
}

class _ProductSpecificationScreenTileState
    extends State<ProductSpecificationScreenTile> {
  @override
  initState() {
    super.initState();
    // Future.microtask(
    //   () => Provider.of<Test>(context, listen: false).getUserDatas(context),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductSpecificationProvider>(
      builder: (ctx, provider, _) => Scaffold(
        appBar: const GlobalAppBar(
          eLabel: 'PRODUCT SPECIFICATION',
          pLabel: 'مشخصات محصول',
        ).build(context),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: ListView(
                  children: [ProductItemDetailsTable(datas: provider.product)],
                ),
              ),
      ),
    );
  }
}
