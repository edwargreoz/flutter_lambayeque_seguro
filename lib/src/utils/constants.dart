// lib/src/utils/constants.dart

import 'package:flutter/material.dart';

// Colores
const Color kPrimaryColor = Color(0xFF0D47A1); // Azul Oscuro para fondo y botones
const Color kAccentColor = Color(0xFF42A5F5);  // Azul más claro para el escudo/logo
const Color kBackgroundColor = Color(0xFFF0F4F8); // Fondo claro de las tarjetas
const Color kTextColor = Color(0xFF212121); // Texto general
const Color kTestCredentialsColor = Color(0xFF757575); // Texto de credenciales de prueba

// Estilos de Texto
const TextStyle kLogoTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TextStyle kWelcomeTitleStyle = TextStyle(
  color: kTextColor,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TextStyle kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

// Estilos de Botón
final ButtonStyle kPrimaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: kPrimaryColor,
  padding: const EdgeInsets.symmetric(vertical: 16),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  elevation: 0,
);