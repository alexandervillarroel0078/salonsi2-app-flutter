// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado con avatar y datos
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      AssetImage('assets/images/default_avatar.png'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Marcos Alexander',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text('marcos@email.com',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                )
              ],
            ),

            const SizedBox(height: 20),

            // Sección: Accesos rápidos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _quickAction(Icons.person, 'Mis datos'),
                _quickAction(Icons.card_giftcard, 'Cupones'),
                _quickAction(Icons.star, 'Favoritos'),
                _quickAction(Icons.support_agent, 'Soporte'),
              ],
            ),

            const SizedBox(height: 24),

            // Sección: Perfil
            const Text('Perfil',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _profileOption(Icons.location_on, 'Mis direcciones'),
            _profileOption(Icons.favorite_border, 'Servicios favoritos'),

            const SizedBox(height: 24),

            // Sección: Actividad
            const Text('Actividad',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _profileOption(Icons.history, 'Historial de servicios'),
            _profileOption(Icons.star_rate, 'Mis calificaciones'),

            const SizedBox(height: 24),

            // Sección: Configuración
            const Text('Configuración',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _profileOption(Icons.notifications, 'Notificaciones'),
            _profileOption(Icons.info_outline, 'Información legal'),
            _profileOption(Icons.logout, 'Cerrar sesión'),
          ],
        ),
      ),
    );
  }

  Widget _quickAction(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.pink[50],
          child: Icon(icon, color: Colors.pinkAccent),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _profileOption(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: Colors.pinkAccent),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
