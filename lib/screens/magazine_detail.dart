import 'dart:convert';

import 'package:ahlan_mobile/models/posts.dart';
import 'package:ahlan_mobile/widgets/reload_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MagazineDetailScreen extends StatefulWidget {
  final Posts post;
  
  const MagazineDetailScreen ({Key? key, required this.post}) : super(key: key);

  @override
  State<MagazineDetailScreen> createState() => _MagazineDetailScreenState();
}

class _MagazineDetailScreenState extends State<MagazineDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final document = parse(widget.post.content.rendered);
    final element = document.getElementsByClassName('df-shortcode-script')[0];
    final json = '{${RegExp(r'[^{}]+(?=})').stringMatch(element.innerHtml)}}';
    final url = jsonDecode(json)['source'].toString();

    return Scaffold(
      appBar: AppBar(title: Text(parse(widget.post.title.rendered).body!.innerHtml)),
      body: const PDF().cachedFromUrl(
        url,
        maxAgeCacheObject: const Duration(days: 30), //duration of cache
        placeholder: (progress) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 15.0),
                Text('Loading $progress%...'),
              ],
            ),
        ),
        errorWidget: (error) => Center(
            child: ReloadDialog(
              desc: error.toString(),
              callback: () => setState(() {}),
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => launchUrlString(
          url,
          mode: LaunchMode.externalNonBrowserApplication
        ),
        tooltip: 'Download PDF',
        child: const Icon(Icons.download),
      ),
    );
  }
}