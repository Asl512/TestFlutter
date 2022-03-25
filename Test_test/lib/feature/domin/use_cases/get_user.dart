import 'package:either_dart/either.dart';
import 'package:test_test/feature/domin/entities/user/user_entity.dart';
import 'package:test_test/feature/domin/repositories/user_repository.dart';

import '../../../core/error/failure.dart';

class GetUser{
  final UserRepository userRepository;

  GetUser(this.userRepository);

  Future<Either<Failure, UserEntity?>>call()async{
    return await userRepository.getUser();
  }
}