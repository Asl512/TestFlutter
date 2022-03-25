import 'package:test_test/feature/domin/entities/post_entity.dart';

class PostModel extends PostEntity{
  PostModel({
    required userId,
    required id,
    required title,
    required body
}) : super(
    userId: userId,
    id:id,
    title: title,
    body: body
  );

  factory PostModel.fromJson(Map<String,dynamic> json){
    return PostModel(
        userId: json["userId"],
        id: json["id"],
        title: '${json["title"][0].toUpperCase()}${json["title"].substring(1)}',
        body: '${json["body"][0].toUpperCase()}${json["body"].substring(1)}',
    );
  }
}