import 'package:flutter/material.dart';
import 'package:flutter_lambayeque_seguro/src/utils/constants.dart'; 

// Widget para las pestañas "Iniciar Sesión" / "Registrarse"
class AuthTabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final bool isRegistration;

  const AuthTabButton({
    super.key,
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
        // Elevación solo si está seleccionado para dar el efecto de botón principal
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

// Widget para el selector de rol "Ciudadano" / "Municipal"
class RoleTabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const RoleTabButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Usamos InkWell para que sea un área clicable con efectos visuales
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          // Color de fondo blanco si está seleccionado
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          // Borde si está seleccionado
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
