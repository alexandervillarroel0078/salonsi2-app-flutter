import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos los Servicios'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder<List<dynamic>>(
        // CAMBIO: usamos List<dynamic> directamente
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
                          Text('Bs ${s['price']}'),
                          if (s['has_discount'] == 1)
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                'Ahora Bs ${s['discount_price']}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('Duración: ${s['duration_minutes']} min'),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
