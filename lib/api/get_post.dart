import 'dart:convert';

import 'package:expanded_cell/models/post_model.dart';
import 'package:expanded_cell/utils.dart';
import 'package:http/http.dart' as http;

abstract class GetPost {
  Future<List<Post>> getPosts();
}

class FetchPost implements GetPost {
  @override
  Future<List<Post>> getPosts() async {
    var response = await http.get(Utils.apiPosts);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Post> posts =
          (data as List).map((itemWord) => Post.fromJson(itemWord)).toList();

      return posts;
    } else {
      throw Exception();
    }
  }
}
