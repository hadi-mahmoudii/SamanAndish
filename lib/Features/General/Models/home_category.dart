// ignore: file_names
// ignore_for_file: empty_catches

import '../../../Core/Models/global.dart';

class HomeCategoryModel {
  final String id;
  final String type;
  final String modelId;
  final String image;
  final String name;
  final String nameEn;
  final String size;

  HomeCategoryModel({
    required this.id,
    required this.type,
    required this.modelId,
    required this.image,
    required this.name,
    required this.nameEn,
    required this.size,
  });

  factory HomeCategoryModel.fromJson(Map datas) {
    // for (var ky in datas.keys) {
    //   print(ky);
    //   print(datas[ky]);

    // }
    String name = 'دسته بندی';
    String nameE = 'Category';
    try {
      name = GlobalEntity.dataFilter(datas['model']['name']);
      nameE = GlobalEntity.dataFilter(datas['model']['name_en']);
    } catch (e) {
    }
    return HomeCategoryModel(
      id: GlobalEntity.dataFilter(datas['id']),
      type: GlobalEntity.dataFilter(datas['model_type']),
      modelId: GlobalEntity.dataFilter(datas['model_id']),
      image: GlobalEntity.dataFilter(datas['main_image']),
      name: name,
      nameEn: nameE,
      size: GlobalEntity.dataFilter(datas['size']),
    );
  }
}
