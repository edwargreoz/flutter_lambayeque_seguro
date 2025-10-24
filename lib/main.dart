// lib/main.dart (MODIFICADO)

import 'package:flutter/material.dart';
import 'package:flutter_lambayeque_seguro/src/pages/login_page.dart'; 
import 'package:flutter_lambayeque_seguro/src/pages/register_page.dart'; 
// NUEVA IMPORTACIÓN
import 'package:flutter_lambayeque_seguro/src/pages/homeCiu_page.dart'; 

void main() {
  runApp(const LambayequeSeguroApp()); 
}

class LambayequeSeguroApp extends StatelessWidget {
  const LambayequeSeguroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lambayeque Seguro',
      // ... (resto del tema)
      theme: ThemeData(
        primaryColor: const Color(0xFF1E3A8A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B82F6),
          primary: const Color(0xFF1E3A8A),
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(), 
        '/register': (context) => const RegisterPage(),
        // NUEVA RUTA
        '/home': (context) => const HomeCiuPage(), 
      },
    );
  }
}