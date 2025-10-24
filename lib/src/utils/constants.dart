import 'package:flutter/material.dart';

// --- Colores ---
const kPrimaryColor = Color(0xFF1E3A8A); // Azul oscuro (Tailwind blue-900)
const kAccentColor = Color(0xFF3B82F6); // Azul más brillante (Tailwind blue-500)
const kTextColor = Color(0xFF374151); // Gris oscuro para texto (Tailwind gray-700)
const kBackgroundColor = Color(0xFFF3F4F6); // Gris muy claro (Tailwind gray-100)
const kTestCredentialsColor = Color(0xFF6B7280); // Gris medio (Tailwind gray-500)

// --- Estilos de Texto ---
const kLogoTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  height: 1, 
);

const kWelcomeTitleStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: kTextColor,
);

const kButtonTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

// --- Estilos de Botón ---
final kPrimaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: kPrimaryColor,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(vertical: 16),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  elevation: 5,
);
