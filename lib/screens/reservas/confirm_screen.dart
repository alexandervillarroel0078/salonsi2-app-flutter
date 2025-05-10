import 'package:flutter/material.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
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
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildOptionCard(
              title: 'Fecha',
              value: '${selectedDate.toLocal()}'.split(' ')[0],
              icon: Icons.calendar_today,
              onTap: () {
                // función vacía
              },
            ),
            _buildOptionCard(
              title: 'Hora',
              value: selectedTime.format(context),
              icon: Icons.access_time,
              onTap: () {
                // función vacía
              },
            ),
            _buildOptionCard(
              title: 'Especialista',
              value: selectedSpecialist,
              icon: Icons.person,
              onTap: () {
                // función vacía
              },
            ),
            _buildOptionCard(
              title: 'Ubicación',
              value: location,
              icon: Icons.location_on,
              onTap: () {
                // función vacía
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null, // 🔒 solo diseño visual, sin acción
        backgroundColor: Colors.pinkAccent,
        icon: const Icon(Icons.check),
        label: const Text('Confirmar pedido'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildOptionCard({
    required String title,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
        trailing: Icon(icon, color: Colors.pinkAccent),
        onTap: onTap,
      ),
    );
  }
}
