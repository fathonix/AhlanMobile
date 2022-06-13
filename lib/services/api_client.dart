import 'dart:convert';

import 'package:ahlan_mobile/models/page_data.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ahlan_mobile/models/posts.dart';

class ApiClient {
  static const String baseUrl = 'https://ahlanmagz.com/wp-json/wp/v2';
  static const String queries = '_embed=true';

  static Future<PageData?> getPosts(int page) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/posts?$queries&page=$page'
    ));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list =
          List<Posts>.from(data.map((x) => Posts.fromJson(x)));
      final totalPages =
          int.parse(response.headers['x-wp-totalpages'] ?? '1');

      debugPrint(response.body);
      debugPrint('totalPages = $totalPages');

      return PageData(
        posts: list,
        totalPages: totalPages,
      );
    } else {
      throw Exception('Unable to get data.');
    }
  }

  static Future<PageData?> getMagazines(int page) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/emagz?$queries&page=$page'
    ));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list =
          List<Posts>.from(data.map((x) => Posts.fromJson(x)));
      final totalPages =
          int.parse(response.headers['x-wp-totalpages'] ?? '1');

      debugPrint(response.body);
      debugPrint('totalPages = $totalPages');

      return PageData(
        posts: list,
        totalPages: totalPages,
      );
    } else {
      throw Exception('Unable to get data.');
    }
  }
}