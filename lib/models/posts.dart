import 'package:ahlan_mobile/models/embedded.dart';
import 'package:ahlan_mobile/models/html_rendered.dart';

class Posts {
  final int id;
  final DateTime dateGmt;
  final HtmlRendered title;
  final HtmlRendered content;
  final Embedded embedded;

  Posts({
    required this.id,
    required this.dateGmt,
    required this.title,
    required this.content,
    required this.embedded,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    id: json['id'],
    dateGmt: DateTime.parse(json['date_gmt'] + 'Z'),
    title: HtmlRendered.fromJson(json['title']),
    content: HtmlRendered.fromJson(json['content']),
    embedded: Embedded.fromJson(json['_embedded']),
  );
}