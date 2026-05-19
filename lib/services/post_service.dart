import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class PostService {
  // Fungsi asynchronous untuk mengambil daftar postingan dari API
  static Future<List<PostModel>> getPosts() async {
    try {
      // Melakukan HTTP GET request ke URL JSONPlaceholder
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      // Mengecek apakah request berhasil (HTTP status code 200 berarti OK/sukses)
      if (response.statusCode == 200) {
        // Mengubah teks JSON (response.body) menjadi tipe List atau Map agar bisa diolah Dart
        List data = jsonDecode(response.body);
        
        // Mengubah setiap elemen JSON dari List menjadi objek class PostModel, lalu jadikan sebuah List utuh
        return data.map((e) => PostModel.fromJson(e)).toList();
      } else {
        // Jika status HTTP bukan 200, berarti ada yang salah dari server atau URL
        throw Exception('Gagal Mengambil Data');
      }
    } catch (e) {
      // Menangkap (catch) error seperti internet putus atau timeout, lalu melemparkan error tersebut
      throw Exception('Error : $e');
    }
  }
}
