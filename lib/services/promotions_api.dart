import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/promotion.dart';

class PromotionsApi {
  static const String baseUrl =
      'https://bellezapro360.com'; // Usa tu URL si es producción

  static Future<List<Promotion>> fetchPromotions() async {
    final response = await http.get(Uri.parse('$baseUrl/api/promotions'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Promotion.fromJson(item)).toList();
    } else {
      throw Exception('Error al cargar promociones');
    }
  }
}
