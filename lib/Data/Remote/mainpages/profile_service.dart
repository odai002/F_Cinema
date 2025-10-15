import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../Core/Constant/url.dart';
import '../Auth/token_service.dart';

class ProfileService {
  Map<String, dynamic>? userProfile;

  Future<void> getProfile() async {
    final token = await TokenService.getToken();

    final response = await http.get(
      Uri.parse(AppLink.getProfile),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    print("StatusCode = ${response.statusCode}");
    print("userprofile = ${response.body}");


    if (response.statusCode == 200) {
      userProfile = jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception("فشل في جلب الملف الشخصي: ${response.statusCode}");
    }
  }
}
