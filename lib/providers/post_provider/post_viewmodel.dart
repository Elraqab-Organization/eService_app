import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/post.dart';
import 'package:e_service_app/model/proposal.dart';
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

  Future<Post> createAPost(final data) async {
    final post = await _service.createPost(data);
    return post;
  }

  Future<Post> deleteAPost(final id) async {
    final post = await _service.deletePost(id);
    return post;
  }

  Future<Proposal> createAProposal(final id, final data) async {
    final proposal = await _service.createProposal(id, data);
    return proposal;
  }
}
