import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../Core/Constant/url.dart';

class EditAccountService {
  final String baseUrl = AppLink.AppUrl; // ضع رابط API الأساسي

  /// 🔹 تحديث بيانات المستخدم فقط (بدون صورة)
  Future<Map<String, dynamic>> updateProfileInfo({
    required String token,
    required String fullName,
    required String phoneNumber,
    required String address,
    required String gender,
  }) async {
    try {
      var url = Uri.parse('$baseUrl/Profile');
      var response = await http.put(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'address': address,
          'gender': gender,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          "success": false,
          "message": "Error: ${response.statusCode}",
          "body": response.body,
        };
      }
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  /// 🔹 رفع الصورة فقط
  Future<Map<String, dynamic>> uploadProfileImage({
    required String token,
    required File imageFile,
  }) async {
    try {
      var url = Uri.parse('$baseUrl/Profile/upload-image');
      var request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = 'Bearer $token';

      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

      var response = await request.send();
      var body = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        return jsonDecode(body);
      } else {
        return {
          "success": false,
          "message": "Error: ${response.statusCode}",
          "body": body,
        };
      }
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }
}
