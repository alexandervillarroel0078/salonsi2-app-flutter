// lib/screens/promotions_screen.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PromotionsScreen extends StatefulWidget {
  const PromotionsScreen({super.key});

  @override
  State<PromotionsScreen> createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  List<dynamic> _promotions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPromotions();
  }

  Future<void> fetchPromotions() async {
    const String baseUrl =
        'http://10.0.2.2:8000'; // Cámbialo si usas producción
    final response = await http.get(Uri.parse('$baseUrl/api/promociones'));

    if (response.statusCode == 200) {
      setState(() {
        _promotions = json.decode(response.body);
        _isLoading = false;
      });
    } else {
      setState(() => _isLoading = false);
      throw Exception('Error al cargar promociones');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todas las promociones'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _promotions.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final promo = _promotions[index];
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
                          promo['title'] ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(promo['description'] ?? ''),
                        const SizedBox(height: 8),
                        Text(
                          'Descuento: ${promo['discount_percentage']}%',
                          style: const TextStyle(color: Colors.pinkAccent),
                        ),
                        Text('Desde: ${promo['start_date']}'),
                        Text('Hasta: ${promo['end_date']}'),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: () {}, // Aquí va la lógica si luego deseas
                          icon: Icon(Icons.add),
                          label: Text('Añadir'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
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
