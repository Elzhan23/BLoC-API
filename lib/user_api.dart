import 'dart:convert';
import 'package:http/http.dart' as http;

import 'user.dart';

class UserApi {
  Future<List<User>> getUsers() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((json) => User.fromJson(json)).toList();
    }

    throw Exception('Server error');
  }
}
