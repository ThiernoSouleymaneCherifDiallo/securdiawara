import 'package:flutter/material.dart';

class Numurgence extends StatelessWidget {
  const Numurgence({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numéros d'urgence et utiles"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image banner
          Container(
            height: 150,
            width: double.infinity, // Pour occuper toute la largeur
            child: Image.asset(
              'assets/images/img_numurgence.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Liste des numéros d'urgence",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          // Emergency numbers grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.3,
                children: [
                  // Emergency tile 1
                  EmergencyTile(
                    icon: Icons.phone_in_talk,
                    number: "112",
                    label: "Urgences Europe",
                    color: Colors.red,
                  ),
                  // Emergency tile 2
                  EmergencyTile(
                    icon: Icons.local_hospital,
                    number: "15",
                    label: "SAMU",
                    color: Colors.purple,
                  ),
                  // Emergency tile 3
                  EmergencyTile(
                    icon: Icons.local_police,
                    number: "17",
                    label: "Police secours",
                    color: Colors.blue,
                  ),
                  // Emergency tile 4
                  EmergencyTile(
                    icon: Icons.fireplace,
                    number: "18",
                    label: "Pompiers",
                    color: Colors.orange,
                  ),
                  // Contact button
                  ContactTile(),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

class EmergencyTile extends StatelessWidget {
  final IconData icon;
  final String number;
  final String label;
  final Color color;

  const EmergencyTile({
    required this.icon,
    required this.number,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: color,
          ),
          SizedBox(height: 10),
          Text(
            number,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text(
              "Contact",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
