import 'dart:convert';
import 'package:http/http.dart' as http;

class EspecialistasApi {
  static const String baseUrl =
      'http://10.0.2.2:8000'; // cambia si usas Render o producción

  static Future<List<dynamic>> fetchEspecialistas() async {
    final response = await http.get(Uri.parse('$baseUrl/api/especialistas'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar especialistas');
    }
  }
}
