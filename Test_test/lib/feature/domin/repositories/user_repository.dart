import 'package:either_dart/either.dart';
import 'package:test_test/feature/domin/entities/user/user_entity.dart';

import '../../../core/error/failure.dart';

abstract class UserRepository{
  Future<Either<Failure, UserEntity?>>getUser(int id);
}