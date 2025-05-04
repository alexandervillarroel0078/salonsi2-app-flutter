import 'package:flutter/material.dart';

class ServiceController extends ChangeNotifier {
  // Lista para almacenar los servicios seleccionados
  List<dynamic> _selectedServices = [];

  // Getter para obtener los servicios seleccionados
  List<dynamic> get selectedServices => _selectedServices;

  // Método para agregar un servicio a la lista
  void addService(dynamic service) {
    _selectedServices.add(service);
    notifyListeners(); // Notificamos a los widgets que escuchan para actualizarse
  }

  // Método para eliminar un servicio de la lista (si es necesario)
  void removeService(dynamic service) {
    _selectedServices.remove(service);
    notifyListeners();
  }

// Método para asignar un especialista a un servicio
  void assignSpecialist(dynamic service, String specialistName) {
    final index = _selectedServices.indexOf(service);
    if (index != -1) {
      // Asignamos el especialista al servicio
      _selectedServices[index]['selectedSpecialist'] = specialistName;
      notifyListeners(); // Notificamos que el servicio ha cambiado
    }
  }

  // Método para vaciar la lista de servicios seleccionados
  void clearServices() {
    _selectedServices.clear();
    notifyListeners();
  }
}
