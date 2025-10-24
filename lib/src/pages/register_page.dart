// lib/src/pages/register_page.dart (MODIFICADO)

import 'package:flutter/material.dart';
import 'package:flutter_lambayeque_seguro/src/utils/constants.dart'; 
import 'package:flutter_lambayeque_seguro/src/widgets/auth_tabs.dart'; 

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // 1. Clave global para identificar y validar el formulario.
  final _formKey = GlobalKey<FormState>();
  
  // 2. Controladores de texto para los campos
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _orgController = TextEditingController();

  // Estado para manejar qué pestaña está activa
  String _selectedRole = 'Ciudadano'; // Valores posibles: 'Ciudadano', 'Municipal'

  @override
  void dispose() {
    // Es buena práctica liberar los controladores
    _dniController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _orgController.dispose();
    super.dispose();
  }
  
  // 3. Lógica de validación y navegación para el registro
  void _submitRegistration() {
    // Si el formulario es válido (pasa las validaciones de los TextFormFields)
    if (_formKey.currentState!.validate()) {
      // Simulación de registro exitoso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registro exitoso como $_selectedRole. Iniciando sesión...'),
          backgroundColor: Colors.green,
        ),
      );
      
      // Redirigir al usuario registrado a la página principal
      // Usamos pushReplacementNamed para que no pueda volver a la pantalla de registro con el botón de retroceso
      Navigator.of(context).pushReplacementNamed('/home');
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
                  // Envolvemos el contenido con Form y la clave
                  child: Form(
                    key: _formKey, 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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

                        // Bloque de Verificación DNI (Solo se muestra para Ciudadano)
                        if (_selectedRole == 'Ciudadano') _buildDniVerificationBlock(),
                        if (_selectedRole == 'Ciudadano') const SizedBox(height: 20),
                        
                        _buildRoleSelector(),
                        const SizedBox(height: 20),

                        // Campos de Formulario de Registro
                        _buildRegisterForm(),
                        const SizedBox(height: 30),

                        // Botón principal de Crear Cuenta con la acción de validación
                        ElevatedButton(
                          onPressed: _submitRegistration, // Llama a la función de registro
                          style: kPrimaryButtonStyle,
                          child: const Text('Crear Cuenta', style: kButtonTextStyle),
                        ),
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

  // --- MÉTODOS AUXILIARES ---
  
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

  Widget _buildAuthTabs(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AuthTabButton(
            label: 'Iniciar Sesión',
            isSelected: false,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AuthTabButton(
            label: 'Registrarse',
            isSelected: true,
            onPressed: () {},
            isRegistration: true,
          ),
        ),
      ],
    );
  }

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

  Widget _buildDniVerificationBlock() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kAccentColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kAccentColor.withOpacity(0.3)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.verified_user_outlined, color: kPrimaryColor),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Para prevenir reportes falsos, verificamos tu identidad con tu DNI. Solo podrás crear una cuenta por DNI.',
              style: TextStyle(color: kTextColor, fontSize: 13.5),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildRegisterForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ----------------------------------------------------
        // BLOQUE CONDICIONAL: DNI (Ciudadano) o Organización (Municipal)
        // ----------------------------------------------------
        if (_selectedRole == 'Ciudadano') ...[
          // Campo DNI con botón de verificar (para ciudadano)
          const Text('DNI *', style: TextStyle(fontWeight: FontWeight.w600, color: kTextColor)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _dniController, // Asignamos el controlador
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '12345678',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  // Validación DNI
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 8) {
                      return 'Ingresa 8 dígitos de DNI';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Lógica de verificación de DNI (simulada)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Verificando DNI... (Simulación)')),
                  );
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
        ] else if (_selectedRole == 'Municipal') ...[
          // Campo Organización (para municipal)
          const Text('Organización', style: TextStyle(fontWeight: FontWeight.w600, color: kTextColor)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _orgController, // Asignamos el controlador
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Municipalidad de...',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            // Validación Organización
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El campo Organización es requerido';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
        ],
        // ----------------------------------------------------
        // CAMPOS COMUNES: Nombre, Correo, Contraseña
        // ----------------------------------------------------
        
        // Campo Nombre Completo
        const Text('Nombre Completo', style: TextStyle(fontWeight: FontWeight.w600, color: kTextColor)),
        const SizedBox(height: 8),
        TextFormField(
          controller: _nameController, // Asignamos el controlador
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            hintText: 'Juan Pérez',
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          // Validación Nombre
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Ingresa tu nombre completo';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Campo Correo Electrónico
        const Text('Correo Electrónico', style: TextStyle(fontWeight: FontWeight.w600, color: kTextColor)),
        const SizedBox(height: 8),
        TextFormField(
          controller: _emailController, // Asignamos el controlador
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'tu@email.com',
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          // Validación Correo
          validator: (value) {
            if (value == null || value.isEmpty || !value.contains('@') || !value.contains('.')) {
              return 'Ingresa un correo electrónico válido';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Campo Contraseña
        const Text('Contraseña', style: TextStyle(fontWeight: FontWeight.w600, color: kTextColor)),
        const SizedBox(height: 8),
        TextFormField(
          controller: _passwordController, // Asignamos el controlador
          obscureText: true,
          decoration: const InputDecoration(
            hintText: '*********',
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          // Validación Contraseña
          validator: (value) {
            if (value == null || value.isEmpty || value.length < 6) {
              return 'La contraseña debe tener al menos 6 caracteres';
            }
            return null;
          },
        ),
      ],
    );
  }

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