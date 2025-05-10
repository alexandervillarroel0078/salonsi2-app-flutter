import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Servicios simulados
    final servicios = [
      {
        'name': 'Corte de Cabello',
        'description': 'Estilo personalizado con asesoramiento',
        'price': 40,
        'duration_minutes': 45,
      },
      {
        'name': 'Limpieza Facial',
        'description': 'Tratamiento profundo para todo tipo de piel',
        'price': 60,
        'duration_minutes': 50,
      },
      {
        'name': 'Manicura + Gel',
        'description': 'Esmaltado en gel con acabado profesional',
        'price': 35,
        'duration_minutes': 40,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos los Servicios'),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: const Color(0xFFFFF6F9),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        itemCount: servicios.length,
        itemBuilder: (context, index) {
          final s = servicios[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen simulada
                  Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Aquí va\nla imagen',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Info del servicio
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          s['name'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.pinkAccent,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          s['description'].toString(),
                          style: const TextStyle(fontSize: 13),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Precio: Bs ${s['price']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Text(
                          'Duración: ${s['duration_minutes']} minutos',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add, size: 16),
                            label: const Text('Añadir',
                                style: TextStyle(fontSize: 12)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              minimumSize: const Size(0, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.check),
        label: const Text('Ver Servicios Seleccionados'),
        backgroundColor: Colors.pinkAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
