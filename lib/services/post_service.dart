import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class PostService {
  //membuat static method
  static Future<List<PostModel>> getPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    //pengkondisian jika response berhasil
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => PostModel.fromJson(e)).toList();
    }
    //jika response gagal
    else {
      throw Exception('Failed to load posts');
    }
  }
}