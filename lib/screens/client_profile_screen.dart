import 'package:flutter/material.dart';
import '../models/cliente.dart';
import '../services/cliente_api.dart';
import 'citas_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({super.key});

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  late Future<Cliente> cliente;

  @override
  void initState() {
    super.initState();
    cargarClienteAutenticado();
  }

  void cargarClienteAutenticado() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('cliente_id');
    if (id != null) {
      setState(() {
        cliente = ClienteApi.fetchCliente(id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5F8),
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
      ),
      body: FutureBuilder<Cliente>(
        future: cliente,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final c = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        c.photoUrl != null && c.photoUrl!.isNotEmpty
                            ? NetworkImage(c.photoUrl!)
                            : const AssetImage('assets/profile_picture.jpg')
                                as ImageProvider,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    c.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Cliente frecuente',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: ListTile(
                      leading:
                          const Icon(Icons.phone, color: Colors.pinkAccent),
                      title: const Text('Teléfono'),
                      subtitle: Text(c.phone),
                    ),
                  ),
                  Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: ListTile(
                      leading:
                          const Icon(Icons.email, color: Colors.pinkAccent),
                      title: const Text('Correo electrónico'),
                      subtitle: Text(c.email),
                    ),
                  ),
                  Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: ListTile(
                      leading: const Icon(Icons.calendar_month,
                          color: Colors.pinkAccent),
                      title: const Text('Citas recientes'),
                      subtitle: const Text('Ver mis citas'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CitasScreen()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Editar perfil',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          } else {
            return const Center(
                child: Text('No se encontraron datos del cliente'));
          }
        },
      ),
    );
  }
}
