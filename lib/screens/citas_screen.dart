import 'package:flutter/material.dart';
import '../models/cita.dart'; // Modelo Cita
import '../services/cita_api.dart'; // Servicio API
import 'package:shared_preferences/shared_preferences.dart';

class CitasScreen extends StatefulWidget {
  const CitasScreen({super.key});

  @override
  State<CitasScreen> createState() => _CitasScreenState();
}

class _CitasScreenState extends State<CitasScreen> {
  late Future<List<Cita>> citas;

  @override
  void initState() {
    super.initState();
    cargarCitasCliente();
  }

  void cargarCitasCliente() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('cliente_id');
    if (id != null) {
      setState(() {
        citas = CitaApi.fetchCitasPorCliente(id);
      });
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Citas Reservadas'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Cita>>(
        future: citas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final citas = snapshot.data!;
            if (citas.isEmpty) {
              return const Center(child: Text('No tienes citas aún.'));
            }

            return ListView.builder(
              itemCount: citas.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final cita = citas[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Servicios: ${cita.servicios.join(", ")}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 8),
                        Text('Fecha: ${cita.fecha}'),
                        Text('Hora: ${cita.hora}'),
                        Text('Especialista: ${cita.especialista}'),
                        Text('Ubicación: ${cita.ubicacion}'),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text('Estado: '),
                            Chip(
                              label: Text(cita.estado),
                              backgroundColor: getEstadoColor(cita.estado),
                              labelStyle: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
                child: Text('No se pudieron cargar las citas.'));
          }
        },
      ),
    );
  }
}
