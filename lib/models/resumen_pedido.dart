class ResumenPedido {
  final List<Map<String, dynamic>> servicios;
  final DateTime fecha;
  final String hora; // En formato string para enviar al backend
  final String especialista;
  final String ubicacion;

  ResumenPedido({
    required this.servicios,
    required this.fecha,
    required this.hora,
    required this.especialista,
    required this.ubicacion,
  });

  Map<String, dynamic> toJson() {
    return {
      'servicios': servicios,
      'fecha': fecha.toIso8601String(),
      'hora': hora,
      'especialista': especialista,
      'ubicacion': ubicacion,
    };
  }
}
