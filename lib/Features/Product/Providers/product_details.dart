// ignore_for_file: empty_catches

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../Core/Config/urls.dart';
import '../../../Core/Models/server_request.dart';
import '../../../Core/Widgets/error_result.dart';
import '../Models/product.dart';

class ProductDetailsProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = true;
  ScrollController scrollController = ScrollController();

  final String productId;

  ProductDetailsProvider(this.productId);

  late ProductModel product;
  getDatas(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final Either<ErrorResult, dynamic> result = await ServerRequest().fetchData(
      Urls.getProduct(productId),
    );
    result.fold(
      (error) async {
        // await ErrorResult.showDlg(error.type, context);
        isLoading = false;
        notifyListeners();
      },
      (result) {
        // print(result);
        // for (var data in result['data'].keys) {
        //   print(data);
        //   print(result['data'][data]);
        // }
        try {
          if (result['message'] == 'Server Error') {
            Fluttertoast.showToast(msg: 'این محصول یافت نشد!');
            Navigator.of(context).pop();
            return;
          }
        } catch (e) {}
        try {
          product = ProductModel.fromJson(result['data']);
        } catch (e) {}
        isLoading = false;
        notifyListeners();
      },
    );
  }

  @override
  void reassemble() {}
}
