import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'controllers/service_controller.dart';

// Screens
import 'screens/main_navigation.dart';
import 'screens/auth/login_screen.dart';
import 'screens/services/services_screen.dart';
import 'screens/reservas/confirm_screen.dart';
import 'screens/reservas/history_screen.dart';
import 'screens/reservas/carrito_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ServiceController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => const MainNavigation(),
        '/services': (context) => const ServicesScreen(),
        //  '/selected-services': (context) => const SelectedServicesScreen(),
        '/confirm': (context) => const ConfirmScreen(),
        '/history': (context) => const HistoryScreen(),
        '/cart': (context) => const CarritoScreen(), // ✔ Ruta lista
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    await Future.delayed(const Duration(seconds: 2));

    if (token != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
