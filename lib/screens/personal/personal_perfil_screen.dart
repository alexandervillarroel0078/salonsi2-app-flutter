import 'package:flutter/material.dart';

class EspecialistaPerfilScreen extends StatelessWidget {
  const EspecialistaPerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Especialista'),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: const Color(0xFFFFF6F9),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 🟣 Imagen simulada
            Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.pink[100],
                shape: BoxShape.circle,
              ),
              child: const Text(
                'IMG',
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 16),
            const Text(
              'Laura Gómez',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Especialista en cabello, rostro y maquillaje',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              'Más de 5 años de experiencia en salones de belleza. Apasionada por resaltar la belleza natural de cada cliente.',
              style: TextStyle(fontSize: 13.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // 🟢 Sección de servicios que ofrece
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Servicios que ofrece',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.pink[700]),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.cut),
                  title: Text('Corte y Peinado'),
                  subtitle: Text('Desde Bs 40'),
                ),
                ListTile(
                  leading: Icon(Icons.face),
                  title: Text('Limpieza Facial'),
                  subtitle: Text('Desde Bs 60'),
                ),
                ListTile(
                  leading: Icon(Icons.brush),
                  title: Text('Maquillaje Profesional'),
                  subtitle: Text('Desde Bs 90'),
                ),
              ],
            ),

            const Divider(height: 30),

            // 🔵 Información adicional
            ListTile(
              leading: const Icon(Icons.star, color: Colors.amber),
              title: const Text('Calificación'),
              subtitle: const Text('4.9 de 5 - 150 opiniones'),
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Disponibilidad'),
              subtitle: const Text('Lunes a Sábado\n09:00 AM - 06:00 PM'),
            ),
            ListTile(
              leading: const Icon(Icons.comment),
              title: const Text('Comentario destacado'),
              subtitle: const Text(
                '“Me encantó el resultado, muy profesional y amable. La recomiendo 100%.”',
              ),
            ),

            const SizedBox(height: 20),
            // 🔘 Botón de acción
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month),
                label: const Text('Agendar con Laura'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
