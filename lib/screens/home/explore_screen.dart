// lib/screens/explore_screen.dart
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorar'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categorías',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildCategoryCard(Icons.spa, 'Faciales'),
                _buildCategoryCard(Icons.content_cut, 'Corte'),
                _buildCategoryCard(Icons.brush, 'Maquillaje'),
                _buildCategoryCard(Icons.cut, 'Manicura'),
                _buildCategoryCard(Icons.sanitizer, 'Depilación'),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Promociones destacadas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.pink[100],
                      image: const DecorationImage(
                        image: AssetImage('assets/images/promo_sample.jpg'),
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.black26, BlendMode.darken),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '2x1 en Tratamientos Capilares',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String label) {
    return Container(
      width: 110,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.pinkAccent),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.pinkAccent),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
