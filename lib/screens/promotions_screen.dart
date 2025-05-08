import 'package:flutter/material.dart';
import '../services/promotions_api.dart';
import '../models/promotion.dart';

class PromotionsScreen extends StatelessWidget {
  const PromotionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6F9),
      appBar: AppBar(
        title: const Text('Promociones'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Promotion>>(
        future: PromotionsApi.fetchPromotions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay promociones disponibles'));
          }

          final promociones = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: promociones.length,
            itemBuilder: (context, index) {
              final promo = promociones[index];
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        promo.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(promo.description),
                      const SizedBox(height: 8),
                      Text(
                        'Descuento: ${promo.discountPercentage.toStringAsFixed(0)}%',
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                      Text(
                        'Válido desde ${promo.startDate} hasta ${promo.endDate}',
                        style: const TextStyle(color: Colors.grey),
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
