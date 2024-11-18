import 'package:flutter/material.dart';
import 'acceuil/acceuil.dart'; // Remplacez "myapp" par le nom exact de votre package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecurGuinee',
      debugShowCheckedModeBanner: false, // Supprime le bandeau "Debug"
      themeMode: ThemeMode.system, // Suit le mode du système
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color.fromARGB(255, 68, 33, 243),
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium:
              TextStyle(color: Colors.black), // Texte principal en clair
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 68, 33, 243),
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey.shade800,
        textTheme: const TextTheme(
          bodyMedium:
              TextStyle(color: Colors.white), // Texte principal en sombre
        ),
      ),
      home: Accueil(),
    );
  }
}