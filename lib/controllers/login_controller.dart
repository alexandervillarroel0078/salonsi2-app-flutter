// lib/controllers/login_controller.dart
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  static Future<void> logoutUser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
  }

  Future<void> login(BuildContext context, Function setLoading) async {
    setLoading(true);

    final result = await ApiService.login(
      emailController.text,
      passwordController.text,
    );

    setLoading(false);

    if (result['success']) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', result['token']); // Guarda el token

      Navigator.pushReplacementNamed(context, '/home');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: Text(result['message']),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}
