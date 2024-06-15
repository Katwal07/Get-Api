import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get_api/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return PostModel(
            userId: e['userId'] as int,
            id: e['id'] as int,
            title: e['title'] as String,
            body: e['body'] as String,
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('Error while fetching data');
    } on TimeoutException {
      throw Exception('Error while fetching data');
    }
    throw Exception('Error while fetching data');
  }
}
