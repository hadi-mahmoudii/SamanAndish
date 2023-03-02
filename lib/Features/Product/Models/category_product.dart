import '../../../Core/Models/global.dart';

class CategoryProductModel {
  final String id;
  final String name;
  final String nameE;
  final String image;
  // final String count;
  // final String parentId;

  CategoryProductModel({
    required this.id,
    required this.name,
    required this.nameE,
    required this.image,
    // @required this.parentId,
    // this.count,
  });
  factory CategoryProductModel.fromJson(Map datas) {
    // for (var data in datas.keys) {
    //   print(data);
    //   print(datas[data]);
    // }
    return CategoryProductModel(
      id: GlobalEntity.dataFilter(datas['id'].toString()),
      name: GlobalEntity.dataFilter(datas['name'].toString()),
      nameE: GlobalEntity.dataFilter(datas['name_en'].toString()),
      image: GlobalEntity.dataFilter(datas['thumbnail'].toString()),
      // parentId: datas['parent_id'].toString() != 'null'
      //     ? datas['parent_id'].toString()
      //     : '',
      // count: datas['children_count'].toString(),
    );
  }
}
