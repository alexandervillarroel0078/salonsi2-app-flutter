import 'package:flutter/material.dart';

class CitasScreen extends StatelessWidget {
  const CitasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista simulada de citas
    final List<Map<String, String>> citas = [
      {
        'servicio': 'Tratamiento facial',
        'fecha': '01 Mayo 2025',
        'hora': '10:00 AM',
        'especialista': 'Dra. Ana Pérez',
        'ubicacion': 'Sucursal Central',
        'estado': 'Pendiente'
      },
      {
        'servicio': 'Peinado y Maquillaje',
        'fecha': '03 Mayo 2025',
        'hora': '3:00 PM',
        'especialista': 'Laura Gómez',
        'ubicacion': 'Sucursal Sur',
        'estado': 'Confirmada'
      },
      {
        'servicio': 'Coloración de Cabello',
        'fecha': '05 Mayo 2025',
        'hora': '1:00 PM',
        'especialista': 'Carla Ruiz',
        'ubicacion': 'Sucursal Norte',
        'estado': 'Cancelada'
      },
    ];

    Color getEstadoColor(String estado) {
      switch (estado.toLowerCase()) {
        case 'pendiente':
          return Colors.orange;
        case 'confirmada':
          return Colors.green;
        case 'cancelada':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Citas Reservadas'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: citas.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final cita = citas[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cita['servicio'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Fecha: ${cita['fecha']}'),
                  Text('Hora: ${cita['hora']}'),
                  Text('Especialista: ${cita['especialista']}'),
                  Text('Ubicación: ${cita['ubicacion']}'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text('Estado: '),
                      Chip(
                        label: Text(cita['estado'] ?? ''),
                        backgroundColor: getEstadoColor(cita['estado'] ?? ''),
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if ((cita['estado'] ?? '').toLowerCase() == 'pendiente')
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.cancel, color: Colors.red),
                        label: const Text(
                          'Cancelar cita',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
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
