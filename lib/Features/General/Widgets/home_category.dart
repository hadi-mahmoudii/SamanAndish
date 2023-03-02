import 'package:flutter/material.dart';
import '../../Product/Models/category.dart';

import '../../../Core/Config/routes.dart';
import '../Models/home_category.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);
  final HomeCategoryModel category;
  @override
  Widget build(BuildContext context) {
    String route = '';
    Object arguments = category.modelId;
    switch (category.type) {
      case 'article':
        if (category.modelId.isEmpty) {
          route = Routes.blogList;
        } else {
          route = Routes.blogDetails;
        }
        break;
      case 'product':
        if (category.modelId.isEmpty) {
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
          id: category.modelId,
          name: 'بازگشت',
          nameE: 'RETURN',
          image: 'null',
          parentId: category.modelId,
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
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0XFFEEEEEE),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            category.image,
            fit: BoxFit.fill,
            height: 60,
          ),
        ),
        margin: const EdgeInsets.all(2.5),
      ),
    );
  }
}
