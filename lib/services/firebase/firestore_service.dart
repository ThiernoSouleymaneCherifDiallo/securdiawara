import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Créer un utilisateur dans Firestore
  Future<void> createUser(String uid, Map<String, dynamic> userData) async {
    try {
      await _firestore.collection('users').doc(uid).set(userData);
    } catch (e) {
      print('Erreur lors de la création de l\'utilisateur: $e');
    }
  }

  // Mettre à jour un utilisateur
  Future<void> updateUser(String uid, Map<String, dynamic> userData) async {
    try {
      await _firestore.collection('users').doc(uid).update(userData);
    } catch (e) {
      print('Erreur lors de la mise à jour de l\'utilisateur: $e');
    }
  }

  // Obtenir les données d'un utilisateur
  Future<DocumentSnapshot?> getUser(String uid) async {
    try {
      return await _firestore.collection('users').doc(uid).get();
    } catch (e) {
      print('Erreur lors de la récupération de l\'utilisateur: $e');
      return null;
    }
  }

  // Sauvegarder un message
  Future<void> saveMessage(Map<String, dynamic> messageData) async {
    try {
      await _firestore.collection('messages').add(messageData);
    } catch (e) {
      print('Erreur lors de la sauvegarde du message: $e');
    }
  }

  // Obtenir les messages
  Stream<QuerySnapshot> getMessages() {
    return _firestore
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
} 