import '../../../Core/Models/global.dart';

class CategoryModel {
  final String id;
  final String name;
  final String nameE;
  final String image;
  final String count;
  final String parentId;

  CategoryModel({
    required this.id,
    required this.name,
    required this.nameE,
    required this.image,
    required this.parentId,
    required this.count,
  });
  factory CategoryModel.fromJson(Map datas) {
    return CategoryModel(
      id: GlobalEntity.dataFilter(datas['id'].toString()),
      name: GlobalEntity.dataFilter(datas['name'].toString()),
      nameE: GlobalEntity.dataFilter(datas['name_en'].toString()),
      image: GlobalEntity.dataFilter(datas['thumbnail'].toString()),
      parentId: GlobalEntity.dataFilter(datas['parent_id'].toString()),
      count: GlobalEntity.dataFilter(datas['children_count'].toString()),
    );
  }
}
