import 'package:ahlan_mobile/models/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';

class BlogDetailScreen extends StatelessWidget {
  final Posts post;

  const BlogDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(parse(post.title.rendered).body!.innerHtml)),
      body: SingleChildScrollView(child: Html(data: post.content.rendered)),
    );
  }
}
