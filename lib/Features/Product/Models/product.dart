// ignore_for_file: empty_catches

import 'package:samanandish/Core/Models/global.dart';

import 'attribute.dart';

class ProductModel {
  final String id;
  final String name;
  final String nameE;
  final String image;
  final String description;
  final List<AttributeModel> variablesAttribute;
  final List<AttributeModel> optionsAttribute;
  final Map<String, String> otherDetails;
  ProductModel({
    required this.id,
    required this.name,
    required this.nameE,
    required this.image,
    required this.description,
    required this.variablesAttribute,
    required this.otherDetails,
    this.optionsAttribute = const [],
  });
  factory ProductModel.fromJson(Map datas) {
    List<AttributeModel> variableItems = [];
    datas['attributes']['variations'].forEach(
      (element) {
        variableItems.add(
          AttributeModel.fromJson(element),
        );
      },
    );
    Map<String, String> otherDetails = {};
    try {
      datas['form_detail']['product_category'].forEach(
        (ky, val) {
          otherDetails[ky] = val;
        },
      );
    } catch (e) {}
    // print(otherDetails);
    return ProductModel(
      id: GlobalEntity.dataFilter(datas['id'].toString()),
      name: GlobalEntity.dataFilter(datas['name'].toString()),
      nameE: GlobalEntity.dataFilter(datas['name_en'].toString()),
      image: GlobalEntity.dataFilter(datas['thumbnail'].toString()),
      description: GlobalEntity.dataFilter(datas['description'].toString()),
      variablesAttribute: variableItems,
      otherDetails: otherDetails,
    );
  }
}
