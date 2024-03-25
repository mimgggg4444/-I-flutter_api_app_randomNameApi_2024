import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api/model/user.dart';
import 'package:rest_api/model/user.dob.dart';
import '../model/user_name.dart';

class UserApi {
  // api 받아오는 로직 Future를 사용한 단일비동기적 구조
  static Future<List<User>> fetchUser() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    final body = response.body;
    final json = jsonDecode(body);

    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      final dob = UserDob(
        age: e['dob']['age'],
        date: e['']['date'],
      );
      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        dob: dob,
      );
    }).toList();
    return users;
  }
}
