import 'package:flutter/material.dart';

class CombosScreen extends StatelessWidget {
  const CombosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final combos = [
      {
        'name': 'Combo Belleza Total',
        'description': 'Incluye corte, lavado y peinado',
        'price': 120.0,
      },
      {
        'name': 'Combo Spa Relajante',
        'description': 'Masaje + limpieza facial + exfoliación',
        'price': 150.0,
      },
      {
        'name': 'Combo Manos y Pies',
        'description': 'Manicura y pedicura con esmalte gel',
        'price': 85.0,
      },
      {
        'name': 'Combo Novia',
        'description': 'Maquillaje, peinado y diseño de cejas',
        'price': 200.0,
      },
      {
        'name': 'Combo Facial Premium',
        'description': 'Hidratación, mascarilla y vapor facial',
        'price': 110.0,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Combos disponibles'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFFFF6F9),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: combos.length,
        itemBuilder: (context, index) {
          final combo = combos[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Simulación de imagen
                Container(
                  height: 120,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Aquí va la imagen',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        combo['name'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        combo['description'] as String,
                        style: const TextStyle(fontSize: 13),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Precio: Bs ${combo['price']}',
                            style: const TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurple,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility_outlined,
                                size: 18, color: Colors.pinkAccent),
                            label: const Text(
                              'Ver detalles',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.pinkAccent),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
