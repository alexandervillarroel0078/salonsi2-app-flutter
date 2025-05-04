import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000';

  // LOGIN
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/api/login');

    print('Intentando login con: $email - $password');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    print('Código de respuesta: ${response.statusCode}');
    print('Respuesta: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['token'] != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['token']);
        await prefs.setString('name', data['user']['name'] ?? '');
        await prefs.setString('email', data['user']['email'] ?? '');
        return {
          'success': true,
          'token': data['token'],
          'user': data['user'],
        };
      }
    }
    return {'success': false, 'message': 'Credenciales incorrectas'};
  }

  // GET TOKEN
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // LOGOUT simple
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

// LOGOUT y navegación
  static Future<void> logoutUser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    // Redirige completamente al login
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  // EJEMPLO: Obtener servicios autenticado
  static Future<List<dynamic>> getServicios() async {
    final response = await http.get(Uri.parse('$baseUrl/api/servicios'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['services']; // 👈 Aquí está la clave
    } else {
      throw Exception('Error al cargar servicios');
    }
  }
}
