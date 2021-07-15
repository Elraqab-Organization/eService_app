import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/post.dart';
import '../rest_service.dart';

class PostService {
  RestService get rest => dependency();

  Future<List<Post>> fetchPosts({String id}) async {
    final List jsonPosts = await rest.getPosts('posts/');
    if (jsonPosts == null || jsonPosts.length == 0) return null;

    final postsList = jsonPosts.map((doc) => Post.fromJson(doc)).toList();

    return postsList;
  }
}
