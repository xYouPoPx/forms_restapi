import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  String nom;
  String prenom;
  int agepersonne;
  DocumentReference reference;

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : nom = snapshot['nom'],
        prenom = snapshot['prenom'],
        agepersonne = snapshot['age'];

  @override
  String toString() => "Record: $nom:$prenom:$agepersonne";
}
