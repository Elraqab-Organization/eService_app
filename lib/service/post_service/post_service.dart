import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/post.dart';
import 'package:e_service_app/model/proposal.dart';
import '../rest_service.dart';

class PostService {
  RestService get rest => dependency();

  Future<List<Post>> fetchPosts({String id}) async {
    final List jsonPosts = await rest.getPosts('posts/');
    if (jsonPosts == null || jsonPosts.length == 0) return null;
//
    final postsList = jsonPosts.map((doc) => Post.fromJson(doc)).toList();

    return postsList;
  }

  Future<Post> createPost(final data) async {
    final jsonPost = await rest.post("posts/", data);
    print(jsonPost);
    if (jsonPost == null || jsonPost.length == 0) return null;

    final post = Post.fromJson(jsonPost);
    return post;
  }

  Future<Proposal> createProposal(final id, final data) async {
    final jsonProposal = await rest.post("posts/$id", data);
    print(jsonProposal);
    if (jsonProposal == null || jsonProposal.length == 0) return null;

    final proposal = Proposal.fromJson(jsonProposal);
    return proposal;
  }
}
