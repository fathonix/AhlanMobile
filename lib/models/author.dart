import 'package:ahlan_mobile/constants.dart';

class Author {
  final String name;
  final String avatarUrl24;

  Author({
    required this.name,
    required this.avatarUrl24,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    name: json['name'],
    avatarUrl24: Map.from(json['avatar_urls']).map((k, v) =>
        MapEntry<String, String>(k, v))['24']
        ?? Constants.defaultAvatarUrl,
  );
}