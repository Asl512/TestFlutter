import 'package:either_dart/either.dart';
import 'package:test_test/feature/data/data_sources/user_remote_data_source.dart';
import 'package:test_test/feature/domin/entities/user/user_entity.dart';
import 'package:test_test/feature/domin/repositories/user_repository.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';

class UserDataRepository extends UserRepository {
  final int id;
  UserDataRepository({required this.id});


  @override
  Future<Either<Failure, UserEntity?>> getUser()async{
    return await _getUser(() {
      return UserRemoteDataSourceImpl().getUser(id);
    });
  }

  Future<Either<Failure, UserEntity?>> _getUser(
      Future<UserEntity?> Function() getUser) async {
    try {
      final remotePosts = await getUser();
      return Right(remotePosts);
    } on ServerException {
      return Left(ServerFailure(error: "The server is not responding"));
    }
  }
}