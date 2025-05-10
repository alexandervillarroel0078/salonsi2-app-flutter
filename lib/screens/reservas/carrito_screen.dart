import 'package:flutter/material.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final servicios = [
      {
        'nombre': 'Corte + Peinado',
        'descripcion': 'Servicio combinado con estilo',
        'duracion': '45 min',
        'especialista': 'Laura G.',
        'fecha': '15 mayo - 14:00',
        'precio': 45.0
      },
      {
        'nombre': 'Limpieza Facial',
        'descripcion': 'Tratamiento profundo',
        'duracion': '60 min',
        'especialista': 'Sofía M.',
        'fecha': '16 mayo - 10:30',
        'precio': 60.0
      },
      {
        'nombre': 'Corte + Peinado',
        'descripcion': 'Servicio combinado con estilo',
        'duracion': '45 min',
        'especialista': 'Laura G.',
        'fecha': '15 mayo - 14:00',
        'precio': 45.0
      },
      {
        'nombre': 'Limpieza Facial',
        'descripcion': 'Tratamiento profundo',
        'duracion': '60 min',
        'especialista': 'Sofía M.',
        'fecha': '16 mayo - 10:30',
        'precio': 60.0
      },
    ];

    final total = servicios.fold<double>(
      0,
      (sum, item) => sum + (item['precio'] as double),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Carrito'),
        backgroundColor: Colors.pinkAccent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFFF6F9),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: servicios.length,
              itemBuilder: (context, index) {
                final item = servicios[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🟣 Título + precio
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['nombre'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Bs ${item['precio']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      // 🔵 Detalles adicionales
                      Text(
                        'Duración: ${item['duracion']}',
                        style: const TextStyle(fontSize: 13),
                      ),
                      Text(
                        'Especialista: ${item['especialista']}',
                        style: const TextStyle(fontSize: 13),
                      ),
                      Text(
                        'Fecha y hora: ${item['fecha']}',
                        style: const TextStyle(fontSize: 13),
                      ),

                      const SizedBox(height: 10),

                      // 🔘 Botones
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: () {}, // lógica futura
                            icon: const Icon(Icons.info_outline,
                                size: 16, color: Colors.pinkAccent),
                            label: const Text(
                              'Ver detalles',
                              style: TextStyle(color: Colors.pinkAccent),
                            ),
                          ),
                          const SizedBox(width: 8),
                          TextButton.icon(
                            onPressed: () {}, // lógica futura
                            icon: const Icon(Icons.delete_outline,
                                size: 16, color: Colors.redAccent),
                            label: const Text(
                              'Eliminar',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),

          // Footer con total y botón
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total a pagar:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Text('Bs $total',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_month),
                    label: const Text('Reservar cita'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
