import 'package:postblocapp/data/datasources/post_remote_datasource.dart';
import 'package:postblocapp/domain/entities/post_entity.dart';
import 'package:postblocapp/domain/repositories/post_repository.dart';

class PostRepoImp implements PostRepository{

  PostRemoteDatasource postRemoteDatasource = PostRemoteDatasourceImpl();

  @override
  Future<List<PostEntity>> getPostFromDataSource() async{
    final posts = await postRemoteDatasource.getPostFromApi();
    return posts;
  }

}