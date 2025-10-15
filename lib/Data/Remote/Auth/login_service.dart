import 'dart:convert';

import '../../../Core/Constant/url.dart';
import 'package:http/http.dart' as http;
class LoginService {
  String? token;

  Future<String> Login(String email, String password) async {
    String url = AppLink.Login;
    final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password
        })
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final Data = jsonDecode(response.body);
      token = Data['token'];
      return token!;
    } else {
      throw Exception('فشل تسجيل الدخول: ${response.statusCode}');
    }
  }
}