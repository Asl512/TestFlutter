import 'package:dio/dio.dart';
import 'package:test_test/core/error/exception.dart';
import 'package:test_test/feature/data/models/post_model.dart';

abstract class PostRemoteDataSource{

  /// Throws [ServerException] for all error codes
  ///
  Future<List<PostModel>> getAllPost();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource{
  static const _BASE_URL = 'https://jsonplaceholder.typicode.com';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  @override
  Future<List<PostModel>> getAllPost()async{
    try{
      final response = await _dio.get('/posts');
      if(response.statusCode == 200){
        return (response.data as List).map((post) => PostModel.fromJson(post)).toList();
      }else {
        throw ServerException();
      }
    }catch(e){
      throw ServerException();
    }
  }
}