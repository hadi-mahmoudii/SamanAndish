import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Config/urls.dart';
import '../../../Core/Models/server_request.dart';
import '../../../Core/Widgets/error_result.dart';
import '../Models/category.dart';

class ProductCategoriesListProvider extends ChangeNotifier
    with ReassembleHandler {
  bool isLoading = false;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();
  int currentPage = 1;
  List<CategoryModel> categories = [];
  final CategoryModel parentCategory;

  bool lockPage = false;

  ProductCategoriesListProvider(this.parentCategory);
  getDatas(BuildContext context, {bool resetPage = false}) async {
    if (resetPage) {
      currentPage = 1;
      lockPage = false;
    }
    if (lockPage) return;
    if (currentPage == 1) {
      categories = [];
      isLoading = true;
      // scrollController.jumpTo(0);
      notifyListeners();
    } else {
      isLoadingMore = true;
      notifyListeners();
    }
    // print(Urls.getcategories(selectedBrand.id));
    final Either<ErrorResult, dynamic> result = await ServerRequest().fetchData(
      Urls.getCategories(parentCategory.id),
    );
    result.fold(
      (error) async {
        // await ErrorResult.showDlg(error.type, context);
        isLoading = false;
        notifyListeners();
      },
      (result) {
        result['data'].forEach((element) {
          categories.add(CategoryModel.fromJson(element));
          // print(result['children']);
        });
        if (currentPage == 1) {
          currentPage += 1;
          isLoading = false;
          notifyListeners();
        } else {
          if (result['data'].length > 0) {
            currentPage += 1;
          } else {
            lockPage = true;
          }
          isLoadingMore = false;
          notifyListeners();
        }
      },
    );
  }

  @override
  void reassemble() {}
}
