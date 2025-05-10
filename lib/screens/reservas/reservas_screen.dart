import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  void _mostrarFiltros(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Filtrar reservas por:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: const Icon(Icons.check_circle_outline),
                title: const Text('Pendientes'),
                onTap: () {
                  Navigator.pop(context);
                  // Lógica futura
                },
              ),
              ListTile(
                leading: const Icon(Icons.cancel_outlined),
                title: const Text('Canceladas'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.done_all),
                title: const Text('Completadas'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _mostrarPeriodo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Seleccionar período',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: const Icon(Icons.today),
                title: const Text('Últimos 7 días'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month),
                title: const Text('Este mes'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.date_range),
                title: const Text('Elegir fecha manual'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Reservas'),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 🟡 Filtros con scroll horizontal
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _mostrarFiltros(context),
                  child: _filterChip(Icons.tune, 'Filtros'),
                ),
                const SizedBox(width: 8),
                _filterChip(null, 'Entregados'),
                const SizedBox(width: 8),
                _filterChip(null, 'Cancelados'),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _mostrarPeriodo(context),
                  child: _filterChip(Icons.keyboard_arrow_down, 'Período'),
                ),
              ],
            ),
          ),

          const Divider(),

          // 🟢 Lista de reservas
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index == 0)
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(bottom: 8),
                        child: const Text(
                          'Cerrado por hoy',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🟣 Imagen como texto
                          Container(
                            width: 60,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.pink[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Aquí va\nla imagen',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // 🔵 Info reserva
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Entregado 03 mayo - 01:30 PM',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Limpieza Facial - Zona Centro',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '1 servicio - Bs 42',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.amber, size: 18),
                                    SizedBox(width: 4),
                                    Text('5.0 Tu opinión',
                                        style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // 🔴 Botón inferior "Repetir"
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.replay),
                label: const Text('Repetir reserva'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  minimumSize: const Size(double.infinity, 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterChip(IconData? icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.grey.shade100,
      ),
      child: Row(
        children: [
          if (icon != null)
            Icon(icon, size: 16, color: Colors.black.withOpacity(0.6)),
          if (icon != null) const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
