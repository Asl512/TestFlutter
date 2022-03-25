import 'package:either_dart/either.dart';
import 'package:test_test/feature/domin/entities/post_entity.dart';
import 'package:test_test/feature/domin/repositories/post_repository.dart';

import '../../../core/error/failure.dart';

class GetAllPosts{
  final PostRepository postRepository;

  GetAllPosts(this.postRepository);

  Future<Either<Failure, List<PostEntity>>>call()async{
    return await postRepository.getAllPosts();
  }
}