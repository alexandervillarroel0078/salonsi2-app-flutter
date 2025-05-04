import 'package:flutter/material.dart';
import 'specialists_screen.dart';
import 'package:salonappflutter/screens/resumen_pedido_screen.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedSpecialist = 'Selecciona un especialista';
  String location = 'Selecciona ubicación';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar Servicios'),
        backgroundColor: Colors.pinkAccent, // Color consistente
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fecha y Hora
            ListTile(
              title: Text(
                  'Fecha: ${selectedDate.toLocal().toString().split(' ')[0]}'),
              trailing: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != selectedDate) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
              ),
            ),

            //hora
            ListTile(
              title: Text('Hora: ${selectedTime.format(context)}'),
              trailing: IconButton(
                icon: const Icon(Icons.access_time),
                onPressed: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (picked != null && picked != selectedTime) {
                    setState(() {
                      selectedTime = picked;
                    });
                  }
                },
              ),
            ),
            const Divider(),

            // Especialista
            ListTile(
              title: Text('Especialista: $selectedSpecialist'),
              trailing: IconButton(
                icon: const Icon(Icons.person),
                onPressed: () async {
                  String? selected = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SpecialistsScreen()),
                  );
                  if (selected != null) {
                    setState(() {
                      selectedSpecialist = selected;
                    });
                  }
                },
              ),
            ),
            const Divider(),

            // Ubicación
            ListTile(
              title: Text('Ubicación: $location'),
              trailing: IconButton(
                icon: const Icon(Icons.location_on),
                onPressed: () async {
                  String? selected = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Seleccionar Ubicación'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: const Text('En el salón'),
                              onTap: () {
                                Navigator.pop(context, 'En el salón');
                              },
                            ),
                            ListTile(
                              title: const Text('A domicilio'),
                              onTap: () {
                                Navigator.pop(context, 'A domicilio');
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  if (selected != null) {
                    setState(() {
                      location = selected;
                    });
                  }
                },
              ),
            ),
            const Divider(),

            // Botón de Pagar
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResumenPedidoScreen(
                servicios: [
                  // este array debe venir desde la lógica de selección real
                  {"name": "Tratamiento facial", "duration": 30, "price": 147},
                  {"name": "Pedicure spa", "duration": 30, "price": 86},
                ],
                fecha: selectedDate,
                hora: selectedTime,
                especialista: selectedSpecialist,
                ubicacion: location,
              ),
            ),
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
