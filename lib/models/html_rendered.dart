class HtmlRendered {
  final String rendered;

  HtmlRendered({required this.rendered});

  factory HtmlRendered.fromJson(Map<String, dynamic> json) => HtmlRendered(
    rendered: json['rendered'],
  );
}