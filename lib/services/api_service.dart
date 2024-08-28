import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static List<User> filterByUsernameLength(List<User> users, int minLength) {
    return users.where((user) => user.username.length > minLength).toList();
  }

  static int countEmailsByDomain(List<User> users, String domain) {
    return users.where((user) => user.email.endsWith(domain)).length;
  }
}
