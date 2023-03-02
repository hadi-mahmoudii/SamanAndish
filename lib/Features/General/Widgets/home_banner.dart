import 'package:flutter/material.dart';

import '../../../Core/Config/routes.dart';
import '../../Product/Models/category.dart';
import '../Models/home_banner.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({
    Key? key,
    required this.banner,
  }) : super(key: key);
  final HomeBannerModel banner;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    String route = '';
    Object arguments = banner.modelId;
    switch (banner.type) {
      case 'article':
        if (banner.modelId.isEmpty) {
          route = Routes.blogList;
        } else {
          route = Routes.blogDetails;
        }
        break;
      case 'product':
        if (banner.modelId.isEmpty) {
          route = Routes.productCategoriesList;
          arguments = CategoryModel(
            id: '(null)',
            name: 'دسته بندی محصولات',
            nameE: 'CATEGORIES',
            image: 'null',
            parentId: 'null',
            count: '2000',
          );
        } else {
          route = Routes.productDetails;
        }
        break;
      case 'product_category':
        route = Routes.productListHome;
        arguments = CategoryModel(
          id: banner.modelId,
          name: 'بازگشت',
          nameE: 'RETURN',
          image: 'null',
          parentId: banner.modelId,
          count: '2000',
        );
        break;
      default:
    }
    return InkWell(
      onTap: () {
        if (route.isNotEmpty) {
          Navigator.of(context).pushNamed(route, arguments: arguments);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          banner.image,
          width: banner.size == 'full' ? size.width - 40 : size.width / 2 - 22,
          height: 100,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
