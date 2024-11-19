import 'package:flutter/material.dart';

class Detailconseil extends StatelessWidget {
  final String title;
  final String details;

  const Detailconseil({
    super.key,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              details,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
