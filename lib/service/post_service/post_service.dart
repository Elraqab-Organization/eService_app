import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/post.dart';
import '../rest_service.dart';

class PostService {
  RestService get rest => dependency();

  Future<List<Post>> fetchPosts({String id}) async {
    final List json = await rest.get('posts/$id');
    if (json == null || json.length == 0) return null;

    final postsList = json.map((doc) => Post.fromJson(doc)).toList();

    return postsList;
  }
}
