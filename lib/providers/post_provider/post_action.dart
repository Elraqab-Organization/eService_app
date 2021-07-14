import 'package:e_service_app/model/post.dart';
import 'package:e_service_app/providers/post_provider/post_viewmodel.dart';
// import 'package:e_service_app/screens/Customer_Posts_Screen/customer_posts_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvider = ChangeNotifierProvider((ref) => CustomerPostsViewmodel());

final postsList = FutureProvider.autoDispose<List<Post>>((ref) async {
  final list = ref.read(postProvider);

  final data = list.getPosts();
  return data;
});
