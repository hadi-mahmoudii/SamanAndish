import 'package:flutter/material.dart';

import '../../Features/Auth/Screens/login.dart';
import '../../Features/Auth/Screens/new_pass.dart';
import '../../Features/Auth/Screens/pass_recovery.dart';
import '../../Features/Auth/Screens/register.dart';
import '../../Features/Auth/Screens/sms_verification.dart';
import '../../Features/Blog/Screens/details.dart';
import '../../Features/Blog/Screens/filter.dart';
import '../../Features/Blog/Screens/list.dart';
import '../../Features/Comment/Screens/comments.dart';
import '../../Features/General/Screens/home.dart';
import '../../Features/General/Screens/privacy.dart';
import '../../Features/Product/Screens/product_categories_list.dart';
import '../../Features/Product/Screens/product_details.dart';
import '../../Features/Product/Screens/product_list.dart';
import '../../Features/Product/Screens/product_list_home.dart';
import '../../Features/Product/Screens/product_specification.dart';
import '../../Features/Profile/Screens/change_pass.dart';
import '../../Features/Profile/Screens/dashboard.dart';
import '../../Features/Profile/Screens/info.dart';
import '../splash_screen.dart';

class Routes {
  static const login = '/login';
  static const register = '/register';
  static const newPass = '/newPass';
  static const passRecovery = '/passRecovery';
  static const smsVerification = '/smsVerification';

  static const blogDetails = '/blogDetails';
  static const blogFilter = '/blogFilter';
  static const blogList = '/blogList';

  static const comment = '/comment';

  static const splashScreen = '/splashScreen';
  static const home = '/home';

  static const productCategoriesList = '/productCategoriesList';
  static const productDetails = '/productDetails';
  static const productList = '/productList';
  static const productListHome = '/productListHome';

  static const productSpecification = '/productSpecification';

  static const dashboard = '/dashboard';
  static const changePass = '/changePass';
  static const info = '/info';
  static const privacy = '/privacy';

  final Map<String, Widget Function(BuildContext)> appRoutes = {
    Routes.login: (ctx) => const LoginScreen(),
    Routes.register: (ctx) => const RegisterScreen(),
    Routes.newPass: (ctx) => const NewPasswordScreen(),
    Routes.passRecovery: (ctx) => const PasswordRecoveryScreen(),
    Routes.smsVerification: (ctx) => const SMSVerificationScreen(),
    Routes.blogDetails: (ctx) => const BlogDetailsScreen(),
    Routes.blogFilter: (ctx) => const BlogFilterScreen(),
    Routes.blogList: (ctx) => const BlogListScreen(),
    Routes.comment: (ctx) => const CommentsScreen(),
    Routes.splashScreen: (ctx) => const SplashScreen(),
    Routes.home: (ctx) => const HomeScreen(),
    Routes.productCategoriesList: (ctx) => const ProductCategoriesListScreen(),
    Routes.productDetails: (ctx) => const ProductDetailsScreen(),
    Routes.productList: (ctx) => const ProductListScreen(),
    Routes.productListHome: (ctx) => const ProductListHomeScreen(),
    Routes.productSpecification: (ctx) => const ProductSpecificationScreen(),
    Routes.dashboard: (ctx) => const DashboardScreen(),
    Routes.changePass: (ctx) => const ChangePasswordScreen(),
    Routes.info: (ctx) => const InfoScreen(),
    Routes.privacy: (ctx) => const PrivacyScreen(),
  };
}
