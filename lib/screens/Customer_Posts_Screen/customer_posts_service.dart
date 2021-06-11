import 'package:flutter/material.dart';
import '../../components/posts_card.dart';

class CustomerPostsServiceScreen extends StatefulWidget {
  @override
  _CustomerPostsServiceScreenState createState() =>
      _CustomerPostsServiceScreenState();
}

class _CustomerPostsServiceScreenState
    extends State<CustomerPostsServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return PostsCard();
  }
}
