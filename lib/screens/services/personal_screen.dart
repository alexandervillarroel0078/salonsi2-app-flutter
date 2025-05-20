import 'package:flutter/material.dart';

class SpecialistsScreen extends StatefulWidget {
  const SpecialistsScreen({super.key});

  @override
  _SpecialistsScreenState createState() => _SpecialistsScreenState();
}

class _SpecialistsScreenState extends State<SpecialistsScreen> {
  late Future<List<dynamic>> specialists;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar Especialista'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: specialists,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final List<dynamic> data = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final specialist = data[index];
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.pinkAccent,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    specialist['name'] ?? 'Sin nombre',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(specialist['email'] ?? ''),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.pop(context, specialist['name']);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
