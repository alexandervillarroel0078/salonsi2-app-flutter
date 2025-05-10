// lib/screens/history_screen.dart
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Servicios'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 5, // Simulación de 5 servicios anteriores
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Servicio: Limpieza Facial',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text('Especialista: María Flores'),
                  const Text('Fecha: 03 de mayo de 2025'),
                  const Text('Hora: 14:00'),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star_half, color: Colors.amber, size: 20),
                      Icon(Icons.star_border, color: Colors.amber, size: 20),
                      SizedBox(width: 8),
                      Text('3.5 / 5'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
