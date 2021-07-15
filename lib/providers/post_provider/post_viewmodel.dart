import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/post.dart';
import 'package:e_service_app/service/post_service/post_service.dart';
import 'package:flutter/cupertino.dart';

class CustomerPostsViewmodel extends ChangeNotifier {
  List<Post> postsList;
  PostService get _service => dependency();

  get posts => postsList;
  set posts(postsList) => postsList = postsList;

  Future<List<Post>> getPosts() async {
    postsList = await _service.fetchPosts();
    return postsList;
  }
}
