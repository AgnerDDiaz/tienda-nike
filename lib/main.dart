import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/models/cart_model.dart';
import 'Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(), // Configuramos el Provider para Cart
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sneaker Store',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: SplashScreen(), // Inicia con la pantalla SplashScreen
      ),
    );
  }
}
