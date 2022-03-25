import 'package:dio/dio.dart';
import 'package:test_test/core/error/exception.dart';
import 'package:test_test/feature/data/models/user/user_model.dart';

abstract class UserRemoteDataSource{

  /// Throws [ServerException] for all error codes
  ///
  Future<UserModel?> getUser(int id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource{
  static const _BASE_URL = 'https://jsonplaceholder.typicode.com';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  @override
  Future<UserModel?> getUser(int id)async{
    try{
      final response = await _dio.get('/users/$id');
      if(response.statusCode == 200){
        return UserModel.fromJson(response.data);
      }else {
        throw ServerException();
      }
    }catch(e){
      List text = e.toString().split(' ');
      if(text.indexOf("[DioErrorType.response]:") == 1){
        return null;
      }
      throw ServerException();
    }
  }
}