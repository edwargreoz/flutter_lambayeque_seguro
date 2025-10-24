// lib/src/pages/register_page.dart

// lib/src/pages/register_page.dart

import 'package:flutter/material.dart';
// ¡CORRECCIÓN AQUÍ!
import 'package:flutter_lambayeque_seguro/src/utils/constants.dart'; 
// ¡CORRECCIÓN AQUÍ!
import 'package:flutter_lambayeque_seguro/src/widgets/auth_tabs.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Estado para manejar qué pestaña está activa
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
                        'Crear Cuenta',
                        style: kWelcomeTitleStyle,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Regístrate para comenzar a reportar incidentes',
                        style: TextStyle(color: kTextColor),
                      ),
                      const SizedBox(height: 20),

                      // Bloque de Verificación DNI
                      _buildDniVerificationBlock(),
                      const SizedBox(height: 20),
                      
                      // Selector de Rol (Ciudadano / Municipal)
                      _buildRoleSelector(),
                      const SizedBox(height: 20),

                      // Campos de Formulario de Registro
                      _buildRegisterForm(),
                      const SizedBox(height: 30),

                      // Botón principal de Crear Cuenta
                      ElevatedButton(
                        onPressed: () {
                          // Lógica de creación de cuenta
                        },
                        style: kPrimaryButtonStyle,
                        child: const Text('Crear Cuenta', style: kButtonTextStyle),
                      ),
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

  // Se reutiliza el header, el selector de rol y el botón inferior de LoginPage
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

  // Widget para el selector de pestañas (Iniciar Sesión / Registrarse) - Reutilizando _AuthTabButton de LoginPage
 Widget _buildAuthTabs(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: AuthTabButton( // ¡CORREGIDO! Ya no es _AuthTabButton
          label: 'Iniciar Sesión',
          isSelected: false,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: AuthTabButton( // ¡CORREGIDO! Ya no es _AuthTabButton
          label: 'Registrarse',
          isSelected: true,
          onPressed: () {},
          isRegistration: true,
        ),
      ),
    ],
  );
}

  // Widget para el selector de rol (Ciudadano / Municipal) - Reutilizando _RoleTabButton de LoginPage
 Widget _buildRoleSelector() {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: RoleTabButton( // ¡CORREGIDO! Ya no es _RoleTabButton
              label: 'Ciudadano',
              isSelected: _selectedRole == 'Ciudadano',
              onPressed: () => setState(() => _selectedRole = 'Ciudadano'),
            ),
          ),
          Expanded(
            child: RoleTabButton( // ¡CORREGIDO! Ya no es _RoleTabButton
              label: 'Municipal',
              isSelected: _selectedRole == 'Municipal',
              onPressed: () => setState(() => _selectedRole = 'Municipal'),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para el bloque de verificación DNI
  Widget _buildDniVerificationBlock() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kAccentColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kAccentColor.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.verified_user_outlined, color: kPrimaryColor),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Para prevenir reportes falsos, verificamos tu identidad con tu DNI. Solo podrás crear una cuenta por DNI.',
              style: TextStyle(color: kTextColor, fontSize: 13.5),
            ),
          ),
        ],
      ),
    );
  }
  
  // Widget para los campos del formulario de registro
  Widget _buildRegisterForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Campo DNI con botón de verificar
        const Text(
          'DNI *',
          style: TextStyle(fontWeight: FontWeight.w600, color: kTextColor),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '12345678',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // Lógica de verificación de DNI
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor.withOpacity(0.1),
                foregroundColor: kPrimaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: kPrimaryColor),
                ),
                elevation: 0,
              ),
              child: const Text('Verificar', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          'Tu DNI se usará para verificar tu identidad y prevenir cuentas duplicadas',
          style: TextStyle(color: kTestCredentialsColor, fontSize: 12),
        ),
        const SizedBox(height: 16),
        
        // Campo Nombre Completo
        const Text(
          'Nombre Completo',
          style: TextStyle(fontWeight: FontWeight.w600, color: kTextColor),
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            hintText: 'Juan Pérez',
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(height: 16),

        // Campo Correo Electrónico
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

        // Campo Contraseña
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

  // Widget para el botón de plataforma ciudadana (Parte inferior) - Reutilizado
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

// Se necesita re-importar los widgets auxiliares si no se quiere hacer un archivo aparte para ellos.
// Para este ejemplo, los incluiremos aquí también o se puede crear un archivo 'lib/src/widgets/auth_tabs.dart'
// para ambos:
//
// class _AuthTabButton ...
// class _RoleTabButton ...
//
// Por brevedad, se considera que ya están definidos o se pueden copiar del archivo login_page.dart
// Si deseas moverlos, es una práctica recomendada en Flutter.