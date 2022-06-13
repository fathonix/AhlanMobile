import 'package:ahlan_mobile/models/author.dart';
import 'package:ahlan_mobile/models/wp_featured_media.dart';

class Embedded {
  final Author? author;
  final WpFeaturedMedia wpFeaturedMedia;

  Embedded({
    required this.author,
    required this.wpFeaturedMedia,
  });

  factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
    author: json['author'] != null
        ? List<Author>.from(
            json['author'].map((x) => Author.fromJson(x)))[0]
        : null,
    wpFeaturedMedia: List<WpFeaturedMedia>.from(
        json['wp:featuredmedia'].map((x) => WpFeaturedMedia.fromJson(x)))[0],
  );
}