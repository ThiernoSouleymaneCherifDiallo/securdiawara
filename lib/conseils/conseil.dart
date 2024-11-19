import 'package:flutter/material.dart';
import 'detailconseil.dart';

class Conseil extends StatelessWidget {
  Conseil({super.key});
  final List<Map<String, String>> adviceList = [
    {
      "title": "Habitation",
      "description":
          "Tranquillité vacances, cambriolages, squats... Protéger son logement",
      "details":
          "Les conseils pour protéger votre habitation comprennent l'installation d'alarmes, la sécurisation des fenêtres, et des astuces pour éloigner les cambrioleurs pendant vos absences."
    },
    {
      "title": "Famille",
      "description": "Protection et sécurité de la famille",
      "details":
          "Assurez la sécurité de vos proches grâce à des gestes simples : sensibilisation des enfants, contacts d'urgence, et vigilance sur les réseaux sociaux."
    },
    {
      "title": "Mobilités et transports",
      "description":
          "Règles de conduite des véhicules, sécurité dans les transports (en commun, publics...)",
      "details":
          "Suivez les meilleures pratiques pour la sécurité routière et dans les transports : port de la ceinture, vigilance aux arrêts et respect du code de la route."
    },
    {
      "title": "Mobilités et transports",
      "description":
          "Règles de conduite des véhicules, sécurité dans les transports (en commun, publics...)",
      "details":
          "Suivez les meilleures pratiques pour la sécurité routière et dans les transports : port de la ceinture, vigilance aux arrêts et respect du code de la route."
    },
    {
      "title": "Numérique",
      "description":
          "Les réseaux sociaux, chantage à la webcam, hameçonnage ou cyber-malveillance",
      "details":
          "Protégez-vous en ligne : utilisez des mots de passe sécurisés, méfiez-vous des e-mails frauduleux, et surveillez votre présence sur les réseaux sociaux."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conseils"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Image banner
          ClipRRect(
            borderRadius: BorderRadius.circular(
                0), // Ajustez si vous voulez des coins arrondis
            child: SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/img_conseil.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: adviceList.length,
              itemBuilder: (context, index) {
                final advice = adviceList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailconseil(
                          title: advice["title"]!,
                          details: advice["details"]!,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: const Color.fromARGB(255, 33, 33, 33),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Replace with actual icons if needed
                          Icon(
                            Icons.help_outline,
                            size: 40,
                            color: const Color.fromARGB(255, 68, 33, 243),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  advice["title"]!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  advice["description"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
