import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    // Détection du mode clair ou sombre
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
            color: primaryColor, // Couleur du texte du menu
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primaryColor, // Couleur de la flèche de retour
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor:
            isDarkMode ? Colors.black : Colors.white, // Fond de l'AppBar
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.settings,
              color: primaryColor, // Couleur des icônes dans la liste
            ),
            title: Text(
              'Paramètres',
              style: TextStyle(
                  color: isDarkMode
                      ? Colors.white
                      : Colors.black), // Couleur du texte
            ),
            onTap: () {
              // Action à exécuter lors du clic sur Paramètres
            },
          ),
          ListTile(
            leading: Icon(
              Icons.search,
              color: primaryColor, // Couleur des icônes dans la liste
            ),
            title: Text(
              'Recherche',
              style: TextStyle(
                  color: isDarkMode
                      ? Colors.white
                      : Colors.black), // Couleur du texte
            ),
            onTap: () {
              // Action à exécuter lors du clic sur Recherche
            },
          ),
          ListTile(
            leading: Icon(
              Icons.contacts,
              color: primaryColor, // Couleur des icônes dans la liste
            ),
            title: Text(
              'Contact',
              style: TextStyle(
                  color: isDarkMode
                      ? Colors.white
                      : Colors.black), // Couleur du texte
            ),
            onTap: () {
              // Action à exécuter lors du clic sur Contact
            },
          ),
          ListTile(
            leading: Icon(
              Icons.update,
              color: primaryColor, // Couleur des icônes dans la liste
            ),
            title: Text(
              'Actualités',
              style: TextStyle(
                  color: isDarkMode
                      ? Colors.white
                      : Colors.black), // Couleur du texte
            ),
            onTap: () {
              // Action à exécuter lors du clic sur Actualités
            },
          ),
        ],
      ),
    );
  }
}
