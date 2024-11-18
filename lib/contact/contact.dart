import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController _controller = TextEditingController();

  // Liste fictive des messages
  final List<String> _messages = [];

  // ci bas les variables de la camera
  File? _image; // Variable pour stocker l'image capturée
  final ImagePicker _picker = ImagePicker();

  // fonction qui permet d'ouvrir la camera...
  Future<void> _openCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
    }
  } // Instance de ImagePicker

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 68, 33, 243),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/user_avatar.png'), // Remplace avec une image locale ou réseau
            ),
            SizedBox(width: 10),
            Text('Nom du Contact'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              // Action pour l'appel vidéo
            },
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              // Action pour l'appel audio
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Actions supplémentaires
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Zone des messages
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: index % 2 == 0
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? Colors.teal.shade100
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(_messages[index]),
                  ),
                );
              },
            ),
          ),
          // Zone d'envoi de message
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: Colors.grey.shade200,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.emoji_emotions, color: Colors.grey),
                  onPressed: () {
                    // Action pour ouvrir les emojis
                  },
                ),
                IconButton(
                  icon: Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: () {
                    // Action pour joindre un document
                  },
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.grey),
                  onPressed: _openCamera,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Écrire un message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _controller.text.isEmpty ? Icons.mic : Icons.send,
                    color: const Color.fromARGB(255, 68, 33, 243),
                  ),
                  onPressed: _controller.text.isEmpty ? null : _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
