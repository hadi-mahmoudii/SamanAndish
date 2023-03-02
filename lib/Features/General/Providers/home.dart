// ignore_for_file: empty_catches

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Config/urls.dart';
import '../../../Core/Models/server_request.dart';
import '../../../Core/Widgets/error_result.dart';
import '../../Blog/Models/blog.dart';
import '../../Product/Models/category_product.dart';
import '../Models/home_banner.dart';
import '../Models/home_category.dart';
import '../Models/home_slider.dart';

class HomeProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = false;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();
  List<HomeCategoryModel> categories = [];
  List<HomeSliderModel> sliders = [];
  // List<HomeBannerModel> largeBanners = [];
  // List<HomeBannerModel> halfBanners = [];
  List<HomeBannerModel> banners = [];
  List<List<BlogModel>> blogs = [];
  List<List<CategoryProductModel>> products = [];

  initApp(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final Either<ErrorResult, dynamic> res = await ServerRequest().fetchData(
      Urls.getBlogItems('1'),
    );
    res.fold(
      (error) async {
        // await ErrorResult.showDlg(error.type, context);
        isLoading = false;
        notifyListeners();
      },
      (result) {
        // print(result);
        try {
          List<BlogModel> tempBlogs =
              []; // reason of this is blogs most show 2taii
          result['data'].forEach((element) {
            tempBlogs.add(BlogModel.fromJson(element));
            // print(result['children']);
          });
          for (var i = 0; i < tempBlogs.length; i++) {
            List<BlogModel> tmpBlog = [];
            tmpBlog.add(tempBlogs[i]);
            i++;
            if (i < tempBlogs.length) {
              tmpBlog.add(tempBlogs[i]);
            }
            blogs.add(tmpBlog);
          }
        } catch (_) {}
      },
    );
    final Either<ErrorResult, dynamic> res2 = await ServerRequest().fetchData(
      Urls.specialProducts,
    );
    res2.fold(
      (error) async {
        // await ErrorResult.showDlg(error.type, context);
        isLoading = false;
        notifyListeners();
      },
      (result) {
        // print(result);
        try {
          List<CategoryProductModel> tempCategories =
              []; // reason of this is blogs most show 2taii
          result['data'].forEach((element) {
            tempCategories
                .add(CategoryProductModel.fromJson(element['product']));
            // print(result['children']);
          });
          for (var i = 0; i < tempCategories.length; i++) {
            List<CategoryProductModel> tmpCategory = [];
            tmpCategory.add(tempCategories[i]);
            i++;
            if (i < tempCategories.length) {
              tmpCategory.add(tempCategories[i]);
            }
            products.add(tmpCategory);
          }
        } catch (_) {}
      },
    );
    final Either<ErrorResult, dynamic> result = await ServerRequest().fetchData(
      Urls.slides,
    );
    result.fold(
      (error) async {
        // await ErrorResult.showDlg(error.type, context);
        isLoading = false;
        notifyListeners();
      },
      (result) {
        // print(result);
        try {
          result['data'].forEach((element) {
            sliders.add(HomeSliderModel.fromJson(element));
            // print(element);
          });
        } catch (e) {}

        // result['data'].forEach((element) {
        //   // products.add(CategoryProductModel.fromJson(element));
        //   print(element);
        // });
        // if (currentPage == 1) {
        //   currentPage += 1;
        //   isLoading = false;
        //   notifyListeners();
        // } else {
        //   if (result['data'].length > 0) {
        //     currentPage += 1;
        //   } else {
        //     lockPage = true;
        //   }
        //   isLoadingMore = false;
        //   notifyListeners();
        // }
      },
    );
    final Either<ErrorResult, dynamic> result2 =
        await ServerRequest().fetchData(
      Urls.banners,
    );
    result2.fold(
      (error) async {
        // await ErrorResult.showDlg(error.type, context);
        isLoading = false;
        notifyListeners();
      },
      (result) {
        // print(result);
        try {
          result['data'].forEach((element) {
            HomeBannerModel banner = HomeBannerModel.fromJson(element);
            banners.add(banner);
            // if (banner.size == 'full') {
            //   largeBanners.add(banner);
            // } else {
            //   halfBanners.add(banner);
            // }
            // print(element);
          });
        } catch (_) {}
        // banners.sort((a, b) => a.size.compareTo(b.size));
        // if (currentPage == 1) {
        //   currentPage += 1;
        //   isLoading = false;
        //   notifyListeners();
        // } else {
        //   if (result['data'].length > 0) {
        //     currentPage += 1;
        //   } else {
        //     lockPage = true;
        //   }
        //   isLoadingMore = false;
        //   notifyListeners();
        // }
      },
    );
    final Either<ErrorResult, dynamic> result3 =
        await ServerRequest().fetchData(
      Urls.homeCategories,
    );
    result3.fold(
      (error) async {
        // await ErrorResult.showDlg(error.type, context);
        isLoading = false;
        notifyListeners();
      },
      (result) {
        // print(result);
        try {
          result['data'].forEach((element) {
            categories.add(HomeCategoryModel.fromJson(element));
            // print(element);
          });
        } catch (e) {}
        isLoading = false;
        notifyListeners();
        // if (currentPage == 1) {
        //   currentPage += 1;
        //   isLoading = false;
        //   notifyListeners();
        // } else {
        //   if (result['data'].length > 0) {
        //     currentPage += 1;
        //   } else {
        //     lockPage = true;
        //   }
        //   isLoadingMore = false;
        //   notifyListeners();
        // }
      },
    );
  }

  @override
  void reassemble() {}
}
