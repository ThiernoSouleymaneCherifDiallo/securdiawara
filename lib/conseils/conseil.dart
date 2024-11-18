import 'package:flutter/material.dart';

class Numurgence extends StatefulWidget {
  const Numurgence({super.key});

  @override
  State<Numurgence> createState() => _NumurgenceState();
}

class _NumurgenceState extends State<Numurgence> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("Conseil"),
        ],
      ),
    );
  }
}
