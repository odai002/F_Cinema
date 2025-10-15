import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  // 🔹 GET
  Future<Map<String, dynamic>> get(
      String endpoint, {
        Map<String, String>? headers,
      }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers,
      );
      return _processResponse(response);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // 🔹 POST
  Future<Map<String, dynamic>> post(
      String endpoint, {
        Map<String, String>? headers,
        dynamic body,
      }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _processResponse(response);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // 🔹 PUT
  Future<Map<String, dynamic>> put(
      String endpoint, {
        Map<String, String>? headers,
        dynamic body,
      }) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _processResponse(response);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // 🔹 DELETE
  Future<Map<String, dynamic>> delete(
      String endpoint, {
        Map<String, String>? headers,
      }) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers,
      );
      return _processResponse(response);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // 🔹 Multipart (رفع صورة)
  Future<Map<String, dynamic>> postMultipart(
      String endpoint, {
        required File file,
        required String fileKey,
        Map<String, String>? headers,
        Map<String, String>? fields,
      }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl$endpoint'));
      if (headers != null) request.headers.addAll(headers);
      if (fields != null) request.fields.addAll(fields);
      request.files.add(await http.MultipartFile.fromPath(fileKey, file.path));

      var response = await request.send();
      var body = await response.stream.bytesToString();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(body);
      } else {
        return {"success": false, "message": "Error: ${response.statusCode}", "body": body};
      }
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // 🔹 معالجة الاستجابة
  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      return {
        "success": false,
        "message": "Error: ${response.statusCode}",
        "body": response.body,
      };
    }
  }
}
