import 'package:postblocapp/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required String title,
    required String body,
    required int id,
    required int userId,
  }) : super(title: title, body: body, id: id, userId: userId);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'],
      body: json['body'],
      id: json['id'],
      userId: json['userId'], 
    );
  }
}
