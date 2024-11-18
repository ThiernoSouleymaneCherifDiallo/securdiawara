import 'package:flutter/material.dart';
import 'package:my_app/actualites/actualites.dart';
import 'package:my_app/menu/menu.dart';
import 'package:my_app/contact/contact.dart'; // Ajoutez cet import
import 'package:my_app/acceuil/widget/categorie.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  int indexPage = 0;

  // Liste des données pour les catégories
  final List<Map<String, dynamic>> services = [
    {
      "icon": Icons.local_police,
      "title": "Police",
      "description": "La police et la gendarmerie sont à votre service."
    },
    {
      "icon": Icons.local_fire_department,
      "title": "Pompiers",
      "description": "Les pompiers interviennent en cas d'incendie."
    },
    {
      "icon": Icons.local_hospital,
      "title": "Hôpital",
      "description": "Accès rapide aux services de santé."
    },
    {
      "icon": Icons.security,
      "title": "Sécurité",
      "description": "Services de sécurité pour votre protection."
    },
    {
      "icon": Icons.phone_in_talk,
      "title": "Urgence",
      "description": "Appelez pour toute urgence médicale."
    },
    {
      "icon": Icons.report,
      "title": "Rapports",
      "description": "Signalez les incidents à proximité."
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Couleur des icônes selon le thème
    final iconColor = Theme.of(context).iconTheme.color;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SecurGuinee",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: iconColor, // Couleur dynamique
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Menu()));
            },
            icon: Icon(
              Icons.menu,
              color: iconColor, // Couleur dynamique
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // Container rouge
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.phone, color: Colors.red),
                const Text(
                  "En cas d'urgence appeler le 1717",
                  style: TextStyle(color: Colors.red),
                ),
                const Icon(Icons.arrow_forward, color: Colors.red),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Rechercher un service",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Champ de recherche
          Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                  left: BorderSide(color: Colors.grey.shade300),
                  right: BorderSide(color: Colors.grey.shade300),
                  bottom: const BorderSide(
                    color: Color.fromARGB(255, 68, 33, 243),
                    width: 2.0,
                  ),
                ),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 68, 33, 243),
                  ),
                  hintText: "Rechercher",
                  border: InputBorder.none, // Supprime les bordures par défaut
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          // Liste des services
          Column(
            children: services
                .map((service) => Padding(
                      padding: const EdgeInsets.only(
                          bottom: 30.0), // Espacement entre les cartes
                      child: categorie(
                        context: context,
                        icon: service['icon'],
                        title: service['title'],
                        description: service['description'],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        onTap: (int index) {
          setState(() {
            indexPage = index;
          });
          if (index == 3) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Contact()));
          } else if (index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Actualites()));
          }
        },
        backgroundColor: Colors.white,
        selectedItemColor:
            Color.fromARGB(255, 68, 33, 243), // Couleur bleue quand sélectionné
        unselectedItemColor: Colors.grey, // Icône grise quand non sélectionné
        iconSize: 30.0, // Taille des icônes
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 68, 33, 243),
        ), // Texte en bleu sélectionné
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey), // Texte en gris non sélectionné
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: "Actualités",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: "Conseils",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: "Contact",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: "N° Urgence",
          ),
        ],
      ),
    );
  }
}
