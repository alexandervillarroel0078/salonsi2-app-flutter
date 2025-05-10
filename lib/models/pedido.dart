class Pedido {
  final List<Map<String, dynamic>> servicios;
  final DateTime fecha;
  final String hora;
  final String especialista;
  final String ubicacion;

  Pedido({
    required this.servicios,
    required this.fecha,
    required this.hora,
    required this.especialista,
    required this.ubicacion,
  });

  Map<String, dynamic> toJson() {
    return {
      'servicios': servicios.map((s) => s['id']).toList(), // solo IDs
      'fecha': fecha.toIso8601String().split('T')[0],
      'hora': hora,
      'especialista': especialista,
      'ubicacion': ubicacion,
    };
  }
}
