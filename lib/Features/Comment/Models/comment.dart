// ignore_for_file: empty_catches

import 'package:samanandish/Core/Models/date-convertor.dart';

import '../../../Core/Models/global.dart';

class CommentModel {
  final String id;
  final String schema;
  final String message;
  final String createdAt;
  final String user;

  CommentModel({
    required this.id,
    required this.schema,
    required this.message,
    required this.createdAt,
    required this.user,
  });

  factory CommentModel.fromJson(Map datas) {
    String username = '-';
    try {
      username = GlobalEntity.dataFilter(datas['user']['name']);
    } catch (e) {}
    return CommentModel(
      id: GlobalEntity.dataFilter(datas['id']),
      schema: GlobalEntity.dataFilter(datas['scheme']),
      message: GlobalEntity.dataFilter(datas['message']),
      createdAt: DateConvertor.dateToJalali(
          GlobalEntity.dataFilter(datas['created_at'])),
      user: username,
    );
  }
}
