import 'package:flutter/material.dart';
import 'HomeScreen.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400], // Fondo más oscuro
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // Márgenes generales
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/nike_2.png',
                width: 350, // Ajustar tamaño de la imagen
              ),
              SizedBox(height: 100),
              Text(
                'Just Do It',
                style: TextStyle(
                  fontSize: 20, // Tamaño del texto más grande
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Brand new sneakers and custom kicks made with premium quality',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.5, // Ajustar espaciado entre líneas
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity, // Botón de ancho completo
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Fondo negro
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Bordes más cuadrados
                    ),
                    padding: EdgeInsets.symmetric(vertical: 25), // Altura del botón
                  ),
                  child: Text(
                    'Shop Now',
                    style: TextStyle(
                      color: Colors.grey[200], // Texto blanco
                      fontSize: 18, // Tamaño del texto
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
