import 'package:flutter/material.dart';

class PromotionsScreen extends StatelessWidget {
  const PromotionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final promociones = [
      {
        'name': 'Descuento verano',
        'description': 'Obtén un 30% en todos los tratamientos faciales.',
        'discount': 30,
        'start': '2025-05-01',
        'end': '2025-05-15',
      },
      {
        'name': 'Combo Belleza',
        'description': 'Peinado + Maquillaje con 20% de descuento.',
        'discount': 20,
        'start': '2025-05-10',
        'end': '2025-05-25',
      },
      {
        'name': 'Descuento en uñas',
        'description': 'Manicura y pedicura con 15% de rebaja.',
        'discount': 15,
        'start': '2025-05-12',
        'end': '2025-05-20',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6F9),
      appBar: AppBar(
        title: const Text('Promociones'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: promociones.length,
        itemBuilder: (context, index) {
          final promo = promociones[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen simulada
                Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Aquí va la imagen\nPromocional',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        promo['name'].toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        promo['description'].toString(),
                        style: const TextStyle(fontSize: 13.5),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Descuento: ${promo['discount']}%',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text(
                        'Válido del ${promo['start']} al ${promo['end']}',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
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
