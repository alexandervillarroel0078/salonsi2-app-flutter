import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/resumen_pedido.dart';
import '../config.dart';

class ResumenController {
  static Future<void> enviarPedido(ResumenPedido pedido) async {
    final url = Uri.parse('${AppConfig.baseUrl}/api/citas');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(pedido.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al enviar pedido');
    }
  }
}
