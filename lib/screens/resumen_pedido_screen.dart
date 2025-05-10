import 'package:flutter/material.dart';
import '../models/resumen_pedido.dart';
import '../controllers/resumen_controller.dart';

class ResumenPedidoScreen extends StatelessWidget {
  final ResumenPedido pedido;

  const ResumenPedidoScreen({super.key, required this.pedido});

  @override
  Widget build(BuildContext context) {
    double total = pedido.servicios
        .fold(0.0, (sum, item) => sum + (item['price'] as num).toDouble());

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
            ...pedido.servicios.map((s) => ListTile(
                  title: Text(s['name']),
                  subtitle: Text('Duración: ${s['duration']} min'),
                  trailing: Text('Bs ${s['price']}'),
                )),
            const Divider(),
            Text('Fecha: ${pedido.fecha.toString().split(' ')[0]}'),
            Text('Hora: ${pedido.hora}'),
            Text('Especialista: ${pedido.especialista}'),
            Text('Ubicación: ${pedido.ubicacion}'),
            const SizedBox(height: 16),
            Text('Total: Bs $total',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await ResumenController.enviarPedido(pedido);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('¡Pedido confirmado!')),
                  );
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Finalizar pedido'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
