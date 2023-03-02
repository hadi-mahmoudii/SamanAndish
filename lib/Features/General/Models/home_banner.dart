// ignore: file_names
// ignore_for_file: empty_catches

import '../../../Core/Models/global.dart';

class HomeBannerModel {
  final String id;
  final String type;
  final String modelId;
  final String image;
  final String size;

  HomeBannerModel({
    required this.id,
    required this.type,
    required this.modelId,
    required this.image,
    required this.size,
  });

  factory HomeBannerModel.fromJson(Map datas) {
    return HomeBannerModel(
      id: GlobalEntity.dataFilter(datas['id']),
      type: GlobalEntity.dataFilter(datas['model_type']),
      modelId: GlobalEntity.dataFilter(datas['model_id']),
      image: GlobalEntity.dataFilter(datas['thumbnail']),
      size: GlobalEntity.dataFilter(datas['size']),
    );
  }
}
