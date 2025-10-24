// lib/src/pages/home_ciu_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_lambayeque_seguro/src/utils/constants.dart';

class HomeCiuPage extends StatelessWidget {
  const HomeCiuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- AppBar de la aplicación ---
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // No necesitamos la flecha de regreso
        title: Row(
          children: [
            const Icon(Icons.shield_outlined, color: kPrimaryColor),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Denuncia', style: TextStyle(color: Colors.black, fontSize: 16)),
                Text('Segura', style: TextStyle(color: kPrimaryColor, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        actions: [
          // Icono de Notificaciones
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: kTextColor),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: kAccentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(minWidth: 12, minHeight: 12),
                  child: const Text(
                    '2', // Placeholder para el número de notificaciones
                    style: TextStyle(color: Colors.white, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          
          // Botón de Nuevo Reporte
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Nuevo Reporte'),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      // --- Contenido Principal ---
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Saludo y Nombre del usuario
            Text('Hola, Juan Pérez', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: kTextColor)),
            const SizedBox(height: 16),
            
            // Título de la Sección
            const Text(
              'Reportes Recientes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kTextColor),
            ),
            Text('Visualiza y gestiona los reportes de incidentes', style: TextStyle(color: kTextColor.withOpacity(0.7))),
            const SizedBox(height: 20),

            // Aquí irían los filtros y la lista de reportes (simulados)
            _buildReportCard(
              title: 'Robo de vehículo en estacionamiento',
              status: 'Pendiente',
              description: 'Se reporta el robo de un vehículo marca Toyota Corolla color gris en el estacionamiento del centro comercial',
            ),
            const SizedBox(height: 16),
             _buildReportCard(
              title: 'Asalto a mano armada',
              status: 'En Proceso',
              description: 'Dos personas armadas asaltaron a transeúntes en la esquina de la avenida',
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para simular una tarjeta de reporte (basado en la imagen)
  Widget _buildReportCard({
    required String title,
    required String status,
    required String description,
  }) {
    Color statusColor = status == 'Pendiente' ? Colors.orange : kPrimaryColor;
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Simulación de etiqueta de Robo (Rojo/HIGH)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('Robo', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
                // Etiqueta de Estado
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(status, style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(description, style: TextStyle(color: kTextColor.withOpacity(0.8))),
            const SizedBox(height: 12),
            // Detalles simulados de ubicación/tiempo
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 16, color: kTextColor),
                const SizedBox(width: 4),
                Text('Av. Javier Prado Este 4200, Santiago de Surco', style: TextStyle(color: kTextColor.withOpacity(0.7), fontSize: 13)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}