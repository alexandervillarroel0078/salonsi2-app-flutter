import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/combo.dart';
import '../config.dart';

class ComboApi {
  static final String baseUrl = AppConfig.baseUrl; // o tu URL en producción

  static Future<List<Combo>> fetchCombos() async {
    final response = await http.get(Uri.parse('$baseUrl/api/combos'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Combo.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los combos');
    }
  }
}
