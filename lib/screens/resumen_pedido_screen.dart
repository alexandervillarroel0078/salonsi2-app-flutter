import 'package:flutter/material.dart';

class ResumenPedidoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> servicios;
  final DateTime fecha;
  final TimeOfDay hora;
  final String especialista;
  final String ubicacion;

  const ResumenPedidoScreen({
    super.key,
    required this.servicios,
    required this.fecha,
    required this.hora,
    required this.especialista,
    required this.ubicacion,
  });

  @override
  Widget build(BuildContext context) {
    double total = servicios.fold(
        0.0, (sum, item) => sum + (item['price'] as num).toDouble());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen del Pedido'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Servicios:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...servicios.map((s) => ListTile(
                  title: Text(s['name']),
                  subtitle: Text('Duración: ${s['duration']} min'),
                  trailing: Text('Bs ${s['price']}'),
                )),
            const Divider(),
            Text('Fecha: ${fecha.toString().split(' ')[0]}'),
            Text('Hora: ${hora.format(context)}'),
            Text('Especialista: $especialista'),
            Text('Ubicación: $ubicacion'),
            const SizedBox(height: 16),
            Text('Total: Bs $total',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('¡Pedido confirmado!')),
                  );

                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  });
                },
                child: const Text('Finalizar pedido'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
