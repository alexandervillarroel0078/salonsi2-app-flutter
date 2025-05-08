import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cliente.dart';

class ClienteApi {
  static const String baseUrl =
      'https://bellezapro360.com'; // CAMBIA por tu IP o dominio en producción

  static Future<Cliente> fetchCliente(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/api/clientes/$id'));

    if (response.statusCode == 200) {
      return Cliente.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al cargar cliente');
    }
  }
}
