import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/product.dart';

class ProductSpecificationProvider extends ChangeNotifier
    with ReassembleHandler {
  bool isLoading = false;
  ScrollController scrollController = ScrollController();

  final ProductModel product;

  ProductSpecificationProvider(this.product);

  getDatas(BuildContext context, {bool resetPage = false}) async {}
  @override
  void reassemble() {}
}
