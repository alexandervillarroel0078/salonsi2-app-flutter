import 'package:flutter/material.dart';
import '../services/combos_api.dart';

class CombosScreen extends StatelessWidget {
  const CombosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos los Combos'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: CombosApi.getCombos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final combos = snapshot.data ?? [];

          return ListView.builder(
            itemCount: combos.length,
            itemBuilder: (context, index) {
              final combo = combos[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                color: const Color(0xFFFFF6F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Image.network(
                          combo['image_path'] ?? '',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image_not_supported),
                        ),
                        title: Text(
                          combo['name'] ?? 'Sin título',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              'Bs ${combo['price']}',
                              style: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (combo['has_discount'] == 1)
                              Text(
                                'Ahora Bs ${combo['discount_price']}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (combo['services'] != null)
                        Wrap(
                          spacing: 6,
                          children: List<Widget>.from(
                            combo['services'].map<Widget>((s) => Chip(
                                  label: Text(s['name'] ?? 'Servicio'),
                                  backgroundColor: Colors.pink.shade100,
                                )),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
