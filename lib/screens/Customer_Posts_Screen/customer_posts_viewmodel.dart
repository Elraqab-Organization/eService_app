import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/post.dart';
import 'package:e_service_app/service/post_service/post_service.dart';

import '../viewmodel.dart';

class CustomerPostsViewmodel extends Viewmodel {
  List<Post> postsList;
  PostService get _service => dependency();

  get posts => postsList;

  Future<List<Post>> getPosts() async {
    turnBusy();
    postsList = await _service.fetchPosts(id: "qdqAu1zFIarbsc0vU7EL");

    if (postsList != null) {
      turnIdle();
      return postsList;
    }

    return postsList;
  }
}
