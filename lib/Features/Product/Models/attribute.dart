
import '../../../Core/Models/global.dart';

class AttributeModel {
  final String id;
  final String name;
  final String nameE;
  final String parentId;
  final String optionType;
  final String attributeType;
  final List<AttributeItemModel> values;

  AttributeModel({
    required this.id,
    required this.name,
    required this.nameE,
    required this.parentId,
    required this.optionType,
    required this.attributeType,
    required this.values,

    // this.count,
  });
  factory AttributeModel.fromJson(Map datas) {
    List<AttributeItemModel> items = [];
    datas['values'].forEach(
      (element) {
        // print(element);
        items.add(
          AttributeItemModel.fromJson(element),
        );
      },
    );
    return AttributeModel(
      id: GlobalEntity.dataFilter(datas['id'].toString()),
      name: GlobalEntity.dataFilter(datas['name'].toString()),
      nameE: GlobalEntity.dataFilter(datas['name_en'].toString()),
      parentId: GlobalEntity.dataFilter(datas['parent_id'].toString()),
      optionType: GlobalEntity.dataFilter(datas['option_type'].toString()),
      attributeType:
          GlobalEntity.dataFilter(datas['attribute_type'].toString()),
      values: items,
    );
  }
}

class AttributeItemModel {
  final String id;
  final String name;
  final String value;
  final String parentId;
  final String media;

  AttributeItemModel({
    required this.id,
    required this.name,
    required this.value,
    required this.parentId,
    required this.media,
  });

  factory AttributeItemModel.fromJson(Map datas) {
    return AttributeItemModel(
      id: GlobalEntity.dataFilter(datas['id'].toString()),
      name: GlobalEntity.dataFilter(datas['name'].toString()),
      value: GlobalEntity.dataFilter(datas['value'].toString()),
      parentId: GlobalEntity.dataFilter(datas['parent_id'].toString()),
      media: GlobalEntity.dataFilter(datas['media'].toString()),
    );
  }
}
