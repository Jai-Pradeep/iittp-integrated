import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String note){
    return notes.add({
      'note':note,
      'timestamp':Timestamp.now(),
    });
  }
}