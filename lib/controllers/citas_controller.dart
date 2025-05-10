// controllers/citas_controller.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../models/cita.dart';
import '../services/cita_api.dart';

class CitasController {
  static Future<List<Cita>> cargarCitasCliente() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('cliente_id');
    if (id != null) {
      return await CitaApi.fetchCitasPorCliente(id);
    }
    return [];
  }

  static Color getEstadoColor(String estado) {
    switch (estado.toLowerCase()) {
      case 'pendiente':
        return const Color(0xFFFFA726); // naranja
      case 'confirmada':
        return const Color(0xFF66BB6A); // verde
      case 'cancelada':
        return const Color(0xFFEF5350); // rojo
      default:
        return const Color(0xFFBDBDBD); // gris
    }
  }
}
