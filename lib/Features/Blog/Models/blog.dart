import '../../../Core/Models/date-convertor.dart';
import '../../../Core/Models/global.dart';

class BlogModel {
  final String id;
  final String scheme;
  final String title;
  final String abs;
  final String content;
  final String createdAt;
  final String thumbnail;
  final String user;
  final String commentsCount;
  final String likesCount;

  BlogModel({
    required this.id,
    required this.scheme,
    required this.title,
    required this.abs,
    required this.content,
    required this.createdAt,
    required this.thumbnail,
    required this.user,
    required this.commentsCount,
    required this.likesCount,
  });

  factory BlogModel.fromJson(Map datas) {
    return BlogModel(
      id: GlobalEntity.dataFilter(datas['id']),
      scheme: GlobalEntity.dataFilter(datas['scheme']),
      title: GlobalEntity.dataFilter(datas['title']),
      abs: GlobalEntity.dataFilter(datas['abstract']),
      content: GlobalEntity.dataFilter(datas['content']),
      createdAt: DateConvertor.dateToJalali(
          GlobalEntity.dataFilter(datas['created_at'])),
      thumbnail: GlobalEntity.dataFilter(datas['thumbnail']),
      user: GlobalEntity.dataFilter(datas['user']['name']),
      commentsCount: GlobalEntity.dataFilter(datas['comments_count']),
      likesCount: GlobalEntity.dataFilter(datas['likes_count']),
    );
  }
}
