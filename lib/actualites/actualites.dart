import 'package:flutter/material.dart';
import 'articledetail.dart';

class Actualites extends StatefulWidget {
  const Actualites({super.key});

  @override
  State<Actualites> createState() => _ActualitesState();
}

class _ActualitesState extends State<Actualites> {
  // Liste d'exemple des actualités
  final List<Map<String, String>> actualites = [
    {
      "title": "Portez plainte en ligne via internet",
      "content":
          "Expérimenté depuis le mois de décembre 2023 en Gironde, ce dispositif gratuit est désormais disponible sur l'ensemble du territoire national. La plainte en ligne permet de porter plainte via une démarche entièrement dématérialisée, sans se déplacer dans une brigade de gendarmerie ou un commissariat de police.",
      "category": "GN - ACTU NATIONALE",
    },
    {
      "title": "Nouvelle application pour signaler les urgences",
      "content":
          "Lancement d’une nouvelle application mobile permettant aux citoyens de signaler des urgences en temps réel. Ce service innovant vise à renforcer l’efficacité des interventions et à améliorer la sécurité publique dans les zones urbaines et rurales.",
      "category": "GN - ACTU INTERNATIONALE",
    },
    {
      "title": "Mise en place d’un système d’alerte dans les écoles",
      "content":
          "Un nouveau dispositif d'alerte vient d'être installé dans plusieurs établissements scolaires pour renforcer la sécurité des élèves. Ce système permet d’envoyer des notifications instantanées aux autorités locales en cas de menace ou d’incident.",
      "category": "GN - ACTU RÉGIONALE",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des articles"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: actualites.length,
        itemBuilder: (context, index) {
          final actu = actualites[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      actu["category"]!,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      actu["title"]!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      actu["content"]!.substring(0, 100) + "...", // Aperçu
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticleDetailPage(
                                title: actu["title"]!,
                                content: actu["content"]!,
                                category: actu["category"]!,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Lire plus",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
