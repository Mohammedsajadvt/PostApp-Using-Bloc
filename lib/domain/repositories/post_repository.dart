import 'package:postblocapp/domain/entities/post_entity.dart';

abstract class PostRepository{
  Future<List<PostEntity>> getPostFromDataSource();
  
}