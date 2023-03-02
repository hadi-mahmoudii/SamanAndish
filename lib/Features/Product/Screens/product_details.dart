import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Config/routes.dart';
import '../../../Core/Widgets/flutter_icons.dart';
import '../../../Core/Widgets/global_appbar.dart';
import '../../../Core/Widgets/loading_widget.dart';
import '../../../Core/Widgets/new_page_navigator_button.dart';
import '../../../Core/Widgets/simple_header.dart';
import '../Providers/product_details.dart';
import '../Widgets/attribute_variable.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductDetailsProvider>(
      create: (ctx) => ProductDetailsProvider(
          ModalRoute.of(context)!.settings.arguments as String),
      child: const ProductDetailsScreenTile(),
    );
  }
}

class ProductDetailsScreenTile extends StatefulWidget {
  const ProductDetailsScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _ProductDetailsScreenTileState createState() =>
      _ProductDetailsScreenTileState();
}

class _ProductDetailsScreenTileState extends State<ProductDetailsScreenTile> {
  @override
  initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<ProductDetailsProvider>(context, listen: false)
          .getDatas(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context).textTheme;
    return Consumer<ProductDetailsProvider>(
      builder: (ctx, provider, _) => Scaffold(
        appBar: const GlobalAppBar(
          eLabel: 'PRODUCT DETAILS',
          pLabel: 'جزئیات محصول',
        ).build(context),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : RefreshIndicator(
                onRefresh: () async => provider.getDatas(context),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Image.network(
                        provider.product.image,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: SimpleHeader(
                        persian: provider.product.name,
                        english: provider.product.nameE,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Text(
                        provider.product.description,
                        textDirection: TextDirection.rtl,
                        style: themeData.bodyText1!.copyWith(
                          color: const Color(0XFF707070),
                          height: 1.5,
                          fontFamily: 'iranyekanregular',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 30,
                        color: Colors.grey,
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) => AttributeVariableWidget(
                        attribute: provider.product.variablesAttribute[index],
                        themeData: themeData,
                      ),
                      separatorBuilder: (ctx, index) => Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 20),
                        child: const Divider(
                          height: 20,
                          color: Colors.grey,
                        ),
                      ),
                      itemCount: provider.product.variablesAttribute.length,
                    ),
                    const SizedBox(height: 35),
                    NewPageNavigatorButton(
                      themeData: themeData,
                      title: 'نظـــــــرات کـــــــــــــاربران',
                      subTitle: 'Comments',
                      color: const Color(0XFF102A45),
                      func: () {
                        Navigator.of(context).pushNamed(
                          Routes.comment,
                          arguments: [
                            provider.productId,
                            'product',
                          ],
                        );
                      },
                      icon: FlutterIcons.chat,
                      // isCommentType: true,
                      // subValue: provider.blog.commentsCount,
                    ),
                    const SizedBox(height: 10),
                    NewPageNavigatorButton(
                      themeData: themeData,
                      title: 'مشخصــــــــات فــــــــنی',
                      subTitle: 'Technical',
                      color: const Color(0XFF2D3B63),
                      func: () {
                        Navigator.of(context).pushNamed(
                          Routes.productSpecification,
                          arguments: provider.product,
                        );
                      },
                      icon: FlutterIcons.align_right,
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
      ),
    );
  }
}
