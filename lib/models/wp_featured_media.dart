class WpFeaturedMedia {
  final String imageUrl;

  WpFeaturedMedia({required this.imageUrl});

  factory WpFeaturedMedia.fromJson(Map<String, dynamic> json) => WpFeaturedMedia(
    imageUrl: json['source_url'],
  );
}