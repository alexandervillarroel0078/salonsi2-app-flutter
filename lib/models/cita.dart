class Cita {
  final int id;
  final String fecha;
  final String hora;
  final String especialista;
  final String ubicacion;
  final String estado;
  final List<String> servicios;

  Cita({
    required this.id,
    required this.fecha,
    required this.hora,
    required this.especialista,
    required this.ubicacion,
    required this.estado,
    required this.servicios,
  });

  factory Cita.fromJson(Map<String, dynamic> json) {
    return Cita(
      id: json['id'],
      fecha: json['fecha'],
      hora: json['hora'],
      especialista: json['personal']['name'] ?? 'Desconocido',
      ubicacion: json['ubicacion'],
      estado: json['estado'],
      servicios: List<String>.from(json['servicios'].map((s) => s['name'])),
    );
  }
}
