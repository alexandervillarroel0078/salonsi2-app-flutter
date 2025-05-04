import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesApi {
  static Future<List<dynamic>> fetchServices() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/services');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data; // <- OJO aquí ya no pones ['services'], sino directamente 'data'
      } else {
        throw Exception('Error al cargar servicios: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}
