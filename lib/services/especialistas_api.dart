import 'dart:convert';
import 'package:http/http.dart' as http;

class EspecialistasApi {
  static const String baseUrl =
      'https://bellezapro360.com'; // cambia si usas Render o producción

  static Future<List<dynamic>> fetchEspecialistas() async {
    final response = await http.get(Uri.parse('$baseUrl/api/especialistas'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar especialistas');
    }
  }
}
