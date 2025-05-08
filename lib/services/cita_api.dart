import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cita.dart';

class CitaApi {
  static const baseUrl =
      'https://bellezapro360.com'; // o tu dominio si está desplegado

  static Future<List<Cita>> fetchCitasPorCliente(int clienteId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/clientes/$clienteId/citas'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Cita.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar citas');
    }
  }
}
