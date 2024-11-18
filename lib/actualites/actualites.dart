import 'package:flutter/material.dart';

class Actualites extends StatefulWidget {
  const Actualites({super.key});

  @override
  State<Actualites> createState() => _ActualitesState();
}

class _ActualitesState extends State<Actualites> {
  // Liste d'exemple des actualités
  final List<Map<String, String>> actualites = [
    {
      "titre": "Portez plainte en ligne via internet",
      "contenu":
          "Expérimenté depuis le mois de décembre 2023 en Gironde, ce dispositif gratuit est désormais disponible sur l'ensemble du territoire national. La plainte en ligne permet de porter plainte via une démarche entièrement dématérialisée, sans se déplacer dans une brigade de gendarmerie ou un commissariat de police.",
      "temps": "il y a 1M",
    },
    {
      "titre": "Nouvelle loi sur la cybersécurité",
      "contenu":
          "Une nouvelle loi visant à renforcer la cybersécurité a été adoptée, offrant une meilleure protection contre les attaques en ligne pour les utilisateurs.",
      "temps": "il y a 3H",
    },
    {
      "titre": "Campagne de vaccination nationale",
      "contenu":
          "La campagne de vaccination contre la grippe saisonnière a débuté cette semaine. Les centres de santé invitent les citoyens à se faire vacciner.",
      "temps": "il y a 2J",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actualités"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: actualites.length,
        itemBuilder: (context, index) {
          final actualite = actualites[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 5.0,
                    height: double.infinity,
                    color: Colors.blue, // Couleur bleue de la bande
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            actualite["titre"]!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            actualite["contenu"]!,
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              actualite["temps"]!,
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
