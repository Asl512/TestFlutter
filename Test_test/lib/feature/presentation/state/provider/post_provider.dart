import 'package:flutter/cupertino.dart';
import 'package:test_test/feature/domin/entities/post_entity.dart';

class PostProvider with ChangeNotifier{
  PostEntity? _post;

  PostEntity? get getPost => _post;

  void changePost(PostEntity newPost){
    _post = newPost;
    notifyListeners();
  }
}