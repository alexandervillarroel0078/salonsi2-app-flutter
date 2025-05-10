// controllers/client_profile_controller.dart
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cliente.dart';
import '../services/cliente_api.dart';

class ClientProfileController {
  static Future<Future<Cliente>?> obtenerClienteAutenticado() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('cliente_id');
    if (id != null) {
      return ClienteApi.fetchCliente(id);
    }
    return null;
  }
}
