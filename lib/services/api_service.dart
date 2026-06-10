import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lapak_batul/config/env.dart'; // FIXED: Import absolut ke env
import 'package:lapak_batul/models/user_model.dart';
import 'package:lapak_batul/config/env.dart'; // FIXED: Import absolut ke user_model

class ApiService {
  static final String baseUrl = Env.apiBaseUrl;
  static Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'x-api-key': Env.apiKey,
  };

  static Future<List<UserModel>> getUsers({int page = 2}) async {
    final url = Uri.parse('${Env.apiBaseUrl}/users?page=$page');
    final response = await http.get(url, headers: _headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      final List<dynamic> dataList = body['data'];
      return dataList.map((item) => UserModel.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat data. Status: ${response.statusCode}');
    }
  }

  static Future<String> login(String email, String password) async {
    final url = Uri.parse('${Env.apiBaseUrl}/login');
    final response = await http.post(
      url,
      headers: _headers,
      body: jsonEncode({'email': email, 'password': password}),
    );

    final Map<String, dynamic> body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return body['token'] as String;
    } else {
      throw Exception(body['error'] ?? 'Login gagal');
    }
  }

  static Future<Map<String, dynamic>> register(
    String email,
    String password,
  ) async {
    final url = Uri.parse('${Env.apiBaseUrl}/register');
    final response = await http.post(
      url,
      headers: _headers,
      body: jsonEncode({'email': email, 'password': password}),
    );

    final Map<String, dynamic> body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return body;
    } else {
      throw Exception(body['error'] ?? 'Registrasi gagal');
    }
  }
}
