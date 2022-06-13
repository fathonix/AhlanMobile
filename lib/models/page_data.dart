import 'package:ahlan_mobile/models/posts.dart';

class PageData {
  final List<Posts> posts;
  final int totalPages;

  PageData({
    required this.posts,
    required this.totalPages,
  });
}
