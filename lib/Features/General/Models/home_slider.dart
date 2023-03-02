// ignore: file_names
// ignore_for_file: empty_catches

import '../../../Core/Models/global.dart';

class HomeSliderModel {
  final String id;
  final String type;
  final String modelId;
  final String image;
  final String name;
  final String nameEn;

  HomeSliderModel(
      {required this.id,
      required this.type,
      required this.modelId,
      required this.image,
      required this.name,
      required this.nameEn});

  factory HomeSliderModel.fromJson(Map datas) {
    return HomeSliderModel(
      id: GlobalEntity.dataFilter(datas['id']),
      type: GlobalEntity.dataFilter(datas['model_type']),
      modelId: GlobalEntity.dataFilter(datas['model_id']),
      image: GlobalEntity.dataFilter(datas['thumbnail']),
      name: GlobalEntity.dataFilter(datas['name']),
      nameEn: GlobalEntity.dataFilter(datas['name_en']),
    );
  }
}
