import 'dart:convert';
import 'package:live_build/constants/api_constant.dart';
import 'package:live_build/models/comment.dart';
import 'package:live_build/models/post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPost() async {
  final response = await http.get(Uri.parse('${apiUrl}posts'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Post.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Comment>> fetchComment(id) async {
  final response = await http.get(Uri.parse('${apiUrl}posts/$id/comments'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Comment.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Post> addPost({required String title, required String body}) async {
  final response = await http.post(
    Uri.parse('${apiUrl}posts'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, dynamic>{
        'userId': 1,
        'title': title,
        'body': body,
      },
    ),
  );

  if (response.statusCode == 201) {
    print(jsonDecode(response.body));
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create post.');
  }
}
