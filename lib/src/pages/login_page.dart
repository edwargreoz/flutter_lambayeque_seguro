// lib/src/pages/login_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_lambayeque_seguro/src/utils/constants.dart';
import 'package:flutter_lambayeque_seguro/src/widgets/auth_tabs.dart'; 
 // Importamos la página de destino

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Clave global para identificar y validar el formulario.
  final _formKey = GlobalKey<FormState>(); 
  
  // 2. Controladores de texto para obtener los valores del formulario.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Estado para manejar qué rol está activo
  String _selectedRole = 'Ciudadano';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Lógica de validación y navegación
  void _submitLogin() {
    // Si el formulario es válido (pasa las validaciones de los TextFormFields)
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final role = _selectedRole;

      // --- 3. Lógica de validación con credenciales de prueba ---
      
      // Credenciales de prueba
      const ciudadanoEmail = 'ciudadano@example.com';
      const municipalEmail = 'municipal@example.com';
      const testPassword = 'password';

      bool isAuthenticated = false;

      if (role == 'Ciudadano' && email == ciudadanoEmail && password == testPassword) {
        isAuthenticated = true;
      } else if (role == 'Municipal' && email == municipalEmail && password == testPassword) {
        isAuthenticated = true;
      }

      if (isAuthenticated) {
        // Redirigir al usuario autenticado a la página principal
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        // Mostrar un error si las credenciales son incorrectas
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Credenciales incorrectas o rol incorrecto.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor, 
        child: Column(
          children: [
            _buildHeader(),
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
                  // Envolvemos el contenido que tiene los TextFields en un Form
                  child: Form(
                    key: _formKey, // Asignamos la clave del formulario
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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

                        _buildRoleSelector(),
                        const SizedBox(height: 20),

                        // --- CAMPO CORREO ELECTRÓNICO CON VALIDACIÓN ---
                        const Text(
                          'Correo Electrónico',
                          style: TextStyle(fontWeight: FontWeight.w600, color: kTextColor),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _emailController, // Asignamos el controlador
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'tu@email.com',
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          // Lógica de Validación de Correo
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingresa tu correo electrónico';
                            }
                            if (!value.contains('@') || !value.contains('.')) {
                              return 'Ingresa un correo válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // --- CAMPO CONTRASEÑA CON VALIDACIÓN ---
                        const Text(
                          'Contraseña',
                          style: TextStyle(fontWeight: FontWeight.w600, color: kTextColor),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _passwordController, // Asignamos el controlador
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: '*********',
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          // Lógica de Validación de Contraseña
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingresa tu contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contraseña debe tener al menos 6 caracteres';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),

                        // --- BOTÓN INICIAR SESIÓN CON ACCIÓN ---
                        ElevatedButton(
                          onPressed: _submitLogin, // Llamamos a la función de validación/lógica
                          style: kPrimaryButtonStyle,
                          child: const Text('Iniciar Sesión', style: kButtonTextStyle),
                        ),
                        const SizedBox(height: 20),

                        // Bloque de credenciales de prueba
                        _buildTestCredentialsBlock(),
                        const SizedBox(height: 40),

                        _buildCitizenPlatformButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- MÉTODOS AUXILIARES (DEBEN ESTAR DEFINIDOS O IMPORTADOS) ---
  // (Asegúrate de que _buildHeader, _buildAuthTabs, _buildRoleSelector, 
  // _buildTestCredentialsBlock y _buildCitizenPlatformButton estén en este archivo)
  
  // Widget para el selector de pestañas (Iniciar Sesión / Registrarse)
  Widget _buildAuthTabs(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AuthTabButton(
            label: 'Iniciar Sesión',
            isSelected: true,
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AuthTabButton(
            label: 'Registrarse',
            isSelected: false,
            onPressed: () {
              Navigator.of(context).pushNamed('/register');
            },
            isRegistration: true,
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
            child: RoleTabButton(
              label: 'Ciudadano',
              isSelected: _selectedRole == 'Ciudadano',
              onPressed: () => setState(() => _selectedRole = 'Ciudadano'),
            ),
          ),
          Expanded(
            child: RoleTabButton(
              label: 'Municipal',
              isSelected: _selectedRole == 'Municipal',
              onPressed: () => setState(() => _selectedRole = 'Municipal'),
            ),
          ),
        ],
      ),
    );
  }

  // Bloque de credenciales de prueba
  Widget _buildTestCredentialsBlock() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kTestCredentialsColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Credenciales de prueba:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kTestCredentialsColor,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Ciudadano: ciudadano@example.com / password',
            style: TextStyle(color: kTestCredentialsColor),
          ),
          Text(
            'Municipal: municipal@example.com / password',
            style: TextStyle(color: kTestCredentialsColor),
          ),
        ],
      ),
    );
  }
  
  // Widget para el header (Logo)
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
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