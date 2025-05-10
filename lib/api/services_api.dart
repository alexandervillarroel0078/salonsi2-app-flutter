import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart'; // Asegúrate de importar correctamente

class ServicesApi {
  static Future<List<dynamic>> fetchServices() async {
    var url = Uri.parse('${AppConfig.baseUrl}/api/services');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Error al cargar servicios: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}
