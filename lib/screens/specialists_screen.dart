import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EspecialistasApi {
  static const String baseUrl =
      'https://bellezapro360.com'; // cambia si usas Render o producción

  static Future<List<dynamic>> fetchEspecialistas() async {
    final response = await http.get(Uri.parse('$baseUrl/api/especialistas'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar especialistas');
    }
  }
}

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
    specialists = EspecialistasApi.fetchEspecialistas(); // Llama a la API
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
            itemCount: data.length,
            itemBuilder: (context, index) {
              final specialist = data[index];
              return ListTile(
                title: Text(specialist[
                    'name']), // Suponiendo que tienes un campo 'name'
                onTap: () {
                  Navigator.pop(context, specialist['name']);
                },
              );
            },
          );
        },
      ),
    );
  }
}
