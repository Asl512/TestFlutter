import 'package:either_dart/either.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../domin/entities/post_entity.dart';
import '../../domin/repositories/post_repository.dart';
import '../data_sources/post_remote_data_source.dart';

class PostsDataRepository extends PostRepository {

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts()async{
    return await _getPosts(() {
      return PostRemoteDataSourceImpl().getAllPost();
    });
  }

  Future<Either<Failure, List<PostEntity>>> _getPosts(
      Future<List<PostEntity>> Function() getPosts) async {
    try {
      final remotePosts = await getPosts();
      return Right(remotePosts);
    } on ServerException {
      return Left(ServerFailure(error: "The server is not responding"));
    }
  }
}