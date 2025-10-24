// lib/src/pages/login_page.dart

import 'package:flutter/material.dart';
// ¡CORRECCIÓN AQUÍ!
import 'package:flutter_lambayeque_seguro/src/utils/constants.dart'; 
// ¡CORRECCIÓN AQUÍ!
// ¡CORRECCIÓN AQUÍ!
import 'package:flutter_lambayeque_seguro/src/pages/register_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Estado para manejar qué pestaña está activa
  String _selectedTab = 'Iniciar Sesión'; // Valores posibles: 'Iniciar Sesión', 'Registrarse'
  String _selectedRole = 'Ciudadano'; // Valores posibles: 'Ciudadano', 'Municipal'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fondo azul oscuro como se ve en la imagen
        color: kPrimaryColor, 
        child: Column(
          children: [
            // Sección superior (Logo y título)
            _buildHeader(),
            // Contenido principal de la tarjeta blanca
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Selector de Pestañas (Iniciar Sesión / Registrarse)
                      _buildAuthTabs(context),
                      const SizedBox(height: 20),
                      
                      const Text(
                        'Bienvenido',
                        style: kWelcomeTitleStyle,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Ingresa tus credenciales para acceder',
                        style: TextStyle(color: kTextColor),
                      ),
                      const SizedBox(height: 20),
                      
                      // Selector de Rol (Ciudadano / Municipal)
                      _buildRoleSelector(),
                      const SizedBox(height: 20),

                      // Campos de Formulario
                      _buildLoginForm(),
                      const SizedBox(height: 30),

                      // Botón principal de Iniciar Sesión
                      ElevatedButton(
                        onPressed: () {
                          // Lógica de inicio de sesión
                        },
                        style: kPrimaryButtonStyle,
                        child: const Text('Iniciar Sesión', style: kButtonTextStyle),
                      ),
                      const SizedBox(height: 20),

                      // Credenciales de Prueba
                      _buildTestCredentials(),
                      const SizedBox(height: 40),

                      // Botón de Plataforma Ciudadana (Pie de página)
                      _buildCitizenPlatformButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para el encabezado (Logo)
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white, // Fondo blanco para el escudo
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.shield_outlined,
              color: kAccentColor,
              size: 30,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Lambayeque\nSeguro',
            textAlign: TextAlign.left,
            style: kLogoTextStyle,
          ),
        ],
      ),
    );
  }

  // Widget para el selector de pestañas (Iniciar Sesión / Registrarse)
  Widget _buildAuthTabs(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _AuthTabButton(
            label: 'Iniciar Sesión',
            isSelected: _selectedTab == 'Iniciar Sesión',
            onPressed: () {
              setState(() => _selectedTab = 'Iniciar Sesión');
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _AuthTabButton(
            label: 'Registrarse',
            isSelected: _selectedTab == 'Registrarse',
            onPressed: () {
              // Navegar a la página de registro
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
            isRegistration: true, // Indica que es la pestaña de registro
          ),
        ),
      ],
    );
  }
  
  // Widget para el selector de rol (Ciudadano / Municipal)
  Widget _buildRoleSelector() {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: _RoleTabButton(
              label: 'Ciudadano',
              isSelected: _selectedRole == 'Ciudadano',
              onPressed: () => setState(() => _selectedRole = 'Ciudadano'),
            ),
          ),
          Expanded(
            child: _RoleTabButton(
              label: 'Municipal',
              isSelected: _selectedRole == 'Municipal',
              onPressed: () => setState(() => _selectedRole = 'Municipal'),
            ),
          ),
        ],
      ),
    );
  }
  
  // Widget para los campos del formulario de login
  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Correo Electrónico',
          style: TextStyle(fontWeight: FontWeight.w600, color: kTextColor),
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'tu@email.com',
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(height: 16),

        const Text(
          'Contraseña',
          style: TextStyle(fontWeight: FontWeight.w600, color: kTextColor),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            hintText: '*********',
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  // Widget para las credenciales de prueba
  Widget _buildTestCredentials() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const Text(
            'Credenciales de prueba:',
            style: TextStyle(fontWeight: FontWeight.bold, color: kTestCredentialsColor),
          ),
          const SizedBox(height: 4),
          Text(
            'Ciudadano: ciudadano@example.com / password',
            style: TextStyle(color: kTestCredentialsColor.withOpacity(0.8)),
          ),
          Text(
            'Municipal: municipal@example.com / password',
            style: TextStyle(color: kTestCredentialsColor.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  // Widget para el botón de plataforma ciudadana (Parte inferior)
  Widget _buildCitizenPlatformButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.85),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'Plataforma ciudadana para reportar incidentes y recibir alertas de seguridad en tiempo real',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// Widget auxiliar para el botón de las pestañas de autenticación (Iniciar Sesión / Registrarse)
class _AuthTabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final bool isRegistration;

  const _AuthTabButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
    this.isRegistration = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: isSelected
            ? kPrimaryColor
            : Colors.white,
        foregroundColor: isSelected
            ? Colors.white
            : kPrimaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isSelected
                ? kPrimaryColor
                : kPrimaryColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        elevation: isSelected ? 4 : 0,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}

// Widget auxiliar para el selector de rol (Ciudadano / Municipal)
class _RoleTabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const _RoleTabButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: kPrimaryColor, width: 1)
              : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? kPrimaryColor : kTextColor.withOpacity(0.7),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}