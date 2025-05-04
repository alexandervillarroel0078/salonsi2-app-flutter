import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import '../controllers/service_controller.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos los Servicios'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: ApiService.getServicios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final servicios = snapshot.data ?? [];

          return ListView.builder(
            itemCount: servicios.length,
            itemBuilder: (context, index) {
              final s = servicios[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: Image.network(
                    s['image_path'] ?? '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported),
                  ),
                  title: Text(s['name'] ?? 'Sin nombre'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(s['description'] ?? ''),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Bs ${s['price']}',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('Duración: ${s['duration_minutes']} min'),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Verificamos si el servicio ya ha sido añadido antes
                            if (Provider.of<ServiceController>(context,
                                    listen: false)
                                .selectedServices
                                .any((service) =>
                                    service['name'] == s['name'])) {
                              // Si el servicio ya está en la lista, mostramos un mensaje
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        '${s['name']} ya ha sido añadido')),
                              );
                            } else {
                              // Si no está en la lista, lo añadimos
                              Provider.of<ServiceController>(context,
                                      listen: false)
                                  .addService(s);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${s['name']} añadido')),
                              );
                            }
                          },
                          icon: const Icon(Icons.add),
                          label: const Text('Añadir'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            textStyle: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navegar a la pantalla de "Servicios seleccionados"
          Navigator.pushNamed(context, '/selected-services');
        },
        icon: const Icon(Icons.check),
        label: const Text('Ver Servicios Seleccionados'),
        backgroundColor: Colors.pinkAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
