class Urls {
  static const baseUrl = 'https://www.willaengine.ir/api/v1';
  static const domain = 'https://www.samanandish.co';
  // static const domain = 'https://www.kamancable.ir';


  static const login = '$baseUrl/login';

  static const signUp = '$baseUrl/register';

  static const verifyForgetPassNumber = '$baseUrl/verify-forgot-password';
  static const sendRePass = '$baseUrl/reset-password';
  static const getForgetPassNumber = '$baseUrl/forgot-password';
  static const verifyRegisterNumber = '$baseUrl/verify-register';
  static const userUpdate = '$baseUrl/owner-user-update';
  static const userInfo = '$baseUrl/owner-user-info';
  static const changePass = '$baseUrl/change-password';

  static const getMyOrderForms = '$baseUrl/order-photos';
  static const addMyOrderForms = '$baseUrl/order-photos-client';
  static String updateMyOrderForms(String id) {
    return '$baseUrl/order-photos-client/$id';
  }

  static String deleteMyOrderForms(String id) {
    return '$baseUrl/order-photos/$id';
  }

  static const addImage = '$baseUrl/file';
  static String removeImage(String id) {
    return '$baseUrl/file/$id';
  }

  static getBlogItems(String page) =>
      '$baseUrl/get-articles?per_page=10&page=$page';
  static getBlogItem(String id) => '$baseUrl/get-articles/$id';
  // static const getCategories = '$baseUrl/get-product-categories';
  static getCategories(String id) {
    return '$baseUrl/get-product-categories?filters[parent_id]=$id';
  }

  static getProducts(String id, String page) {
    return '$baseUrl/get-products?filters[product_category]=$id&page=$page';
  }
  static getProductsHome(String id, String page) {
    return '$baseUrl/get-products?filters[product_category_self_child]=$id&page=$page';
  }

  static getProduct(String id) {
    return '$baseUrl/get-products/$id';
  }

  static const sendComment = '$baseUrl/comments';
  static String getComments(String id, String type, String page) {
    return '$baseUrl/get-comments?per_page=10&rel_id=$id&rel_type=$type&page=$page';
  }

  static const slides = '$baseUrl/get-slider';
  static const banners = '$baseUrl/get-banner';
  static const homeCategories = '$baseUrl/get-special-category';
  static const specialProducts =
      '$baseUrl/get-store-products-filtered/special_sell';
}
