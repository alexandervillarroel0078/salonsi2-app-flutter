// lib/services/combos_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class CombosApi {
  static const String baseUrl = 'http://10.0.2.2:8000';

  static Future<List<dynamic>> getCombos() async {
    final response = await http.get(Uri.parse('$baseUrl/api/combos'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar combos');
    }
  }
}
