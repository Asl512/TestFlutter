import 'package:either_dart/either.dart';
import 'package:test_test/feature/domin/entities/post_entity.dart';

import '../../../core/error/failure.dart';

abstract class PostRepository{
  Future<Either<Failure, List<PostEntity>>>getAllPosts();
}