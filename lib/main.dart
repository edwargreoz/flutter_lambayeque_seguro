// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_lambayeque_seguro/src/pages/login_page.dart'; 
import 'package:flutter_lambayeque_seguro/src/pages/register_page.dart'; 

void main() {
  // 1. LLAMA A LA CLASE REAL DE TU APLICACIÓN
  runApp(const LambayequeSeguroApp()); 
}

// Se mantiene el nombre de tu clase de aplicación (LambayequeSeguroApp)
class LambayequeSeguroApp extends StatelessWidget {
  const LambayequeSeguroApp({super.key}); // Se usa 'super.key' para la convención moderna

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lambayeque Seguro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Los colores que definiste son correctos para el tema.
        primaryColor: const Color(0xFF1E3A8A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B82F6),
          primary: const Color(0xFF1E3A8A),
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        // 2. CORRECCIÓN DEL NOMBRE DE LA CLASE: Usar 'LoginPage' (PascalCase)
        '/': (context) => const LoginPage(), 
        '/register': (context) => const RegisterPage(),
      },
      // Alternativa (más simple): usar la propiedad 'home'
      // home: const LoginPage(),
    );
  }
}