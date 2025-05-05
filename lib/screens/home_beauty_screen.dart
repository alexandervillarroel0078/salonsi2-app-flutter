import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import '../services/especialistas_api.dart';
import 'services_screen.dart';
import 'combos_screen.dart';
import 'package:salonappflutter/screens/promotions_screen.dart';

class HomeBeautyScreen extends StatelessWidget {
  const HomeBeautyScreen({super.key});

  static Widget _buildPromoCard(String title, Color color) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Text(
            'Ver más',
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }

  static Widget _buildCategory(String label, IconData icon) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Icon(icon, color: Colors.pinkAccent),
        ),
        const SizedBox(height: 8),
        Text(label,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 12))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // parte superior y cerrar secion
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Ahana',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Welcome to RedElx Salon',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon:
                            const Icon(Icons.logout, color: Colors.pinkAccent),
                        onPressed: () => HomeController.confirmLogout(context),
                      ),
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.pinkAccent,
                        backgroundImage: AssetImage('assets/avatar.jpg'),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Promociones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '#Promociones',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PromotionsScreen()),
                      );
                    },
                    child: const Text(
                      'Ver todas',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildPromoCard('¡50% en peinados!', Colors.pink),
                    _buildPromoCard('2x1 en faciales', Colors.orange),
                    _buildPromoCard('Descuento en combos', Colors.deepPurple),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Combos
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CombosScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.pinkAccent),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Descubre nuestros Combos',
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.pink, size: 16),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Categorías y servicios
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ServicesScreen()),
                      );
                    },
                    child: const Text(
                      'Ver todos los servicios',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
                children: [
                  _buildCategory('Hair Style', Icons.cut),
                  _buildCategory('Facial', Icons.face),
                  _buildCategory('Coloring', Icons.brush),
                  _buildCategory('Makeup', Icons.auto_fix_high),
                  _buildCategory('Hairdryer', Icons.air),
                  _buildCategory('Shampoo', Icons.water_drop),
                  _buildCategory('Hair Spa', Icons.spa),
                  _buildCategory('More', Icons.more_horiz),
                ],
              ),

              const SizedBox(height: 28),

              // Especialistas (Diseño
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Hair Specialist',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('View More', style: TextStyle(color: Colors.pink)),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 160,
                child: FutureBuilder<List<dynamic>>(
                  future: EspecialistasApi.fetchEspecialistas(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final especialistas = snapshot.data!;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: especialistas.length,
                      itemBuilder: (context, index) {
                        final esp = especialistas[index];
                        return Container(
                          width: 120,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16)),
                                child: Image.network(
                                  esp['photo_url'] ?? '',
                                  height: 90,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.image_not_supported),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      esp['name'] ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 4),
                                    const Icon(Icons.star,
                                        size: 14, color: Colors.amber),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
