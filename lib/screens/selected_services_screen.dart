import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/service_controller.dart';
import '/screens/confirm_screen.dart';

class SelectedServicesScreen extends StatelessWidget {
  const SelectedServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Accedemos a los servicios seleccionados desde el ServiceController
    final selectedServices =
        Provider.of<ServiceController>(context).selectedServices;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios Seleccionados'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: selectedServices.isEmpty
          ? const Center(child: Text('No has seleccionado servicios.'))
          : ListView.builder(
              itemCount: selectedServices.length,
              itemBuilder: (context, index) {
                final s = selectedServices[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: Image.network(
                      s['image_path'] ?? '',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image_not_supported),
                    ),
                    title: Text(s['name'] ?? 'Sin nombre'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(s['description'] ?? ''),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              'Bs ${s['price']}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text('Duración: ${s['duration_minutes']} min'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Eliminar el servicio de la lista
                        Provider.of<ServiceController>(context, listen: false)
                            .removeService(s);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${s['name']} eliminado'),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navegar a la pantalla de "Confirmar"
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConfirmScreen()),
          );
        },
        icon: const Icon(Icons.check),
        label: const Text('Confirmar'),
        backgroundColor: Colors.pinkAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
