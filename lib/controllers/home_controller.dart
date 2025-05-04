import 'package:flutter/material.dart';

import '../services/api_service.dart';

class HomeController {
  static Future<void> confirmLogout(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirmar'),
        content: const Text('¿Deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await ApiService.logoutUser(context);
    }
  }

  static Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          // aqui boton
          const SizedBox(height: 16),
          // aqui boton de combos

          const SizedBox(height: 16),
          // aqui boton de promociones
          const Spacer(),
        ],
      ),
    );
  }

  static ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.pink.shade100,
      foregroundColor: Colors.deepPurple,
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      textStyle: const TextStyle(fontSize: 16),
    );
  }
}
