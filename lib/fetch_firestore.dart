import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/records.dart';

class FetchFirestore extends StatefulWidget {
  @override
  FetchFirestoreState createState() {
    return FetchFirestoreState();
  }
}

class FetchFirestoreState extends State<FetchFirestore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fetch Firestore',
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('testflutter').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.nom),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: _listTile(context, data)),
    );
  }

  Widget _listTile(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);
    return ListTile(
      isThreeLine: true,
      title: Text(record.nom),
      subtitle: Text('${record.prenom}\n${record.agepersonne}'),
      trailing: _trailing(context, data),
      onTap: () => print(record),
    );
  }

  Widget _trailing(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);
    return Container(
        child: GestureDetector(
      onTap: () => _increaseAge(data),
      child: Container(
        child: Icon(Icons.add_circle),
      ),
    ));
  }

  int _increaseAge(DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);
    record.agepersonne++;
    print(record.agepersonne);
    return record.agepersonne;
  }
}
