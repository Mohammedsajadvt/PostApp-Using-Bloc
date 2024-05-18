import 'package:postblocapp/data/repositories/post_repo_implement.dart';
import 'package:postblocapp/domain/entities/post_entity.dart';
import 'package:postblocapp/domain/repositories/post_repository.dart';


class PostUsecase {

  PostRepository postRepo = PostRepoImp();

  Future<List<PostEntity>> getPostFromDataSource() async {
    final posts = await postRepo.getPostFromDataSource();
    return posts;
  }
}
