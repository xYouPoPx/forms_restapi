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
  int age = 0;
  Record record;

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
    this.record = Record.fromSnapshot(data);
    print('builListItem: ${record.agepersonne}');

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
    // final record = Record.fromSnapshot(data);
    return ListTile(
      isThreeLine: true,
      title: Text(this.record.nom),
      subtitle: Text('list Tile: ${record.prenom}\n${record.agepersonne}'),
      trailing: _trailing(context, data),
      //onTap: () => print(age),
    );
  }

  Widget _trailing(BuildContext context, DocumentSnapshot data) {
    //final record = Record.fromSnapshot(data);
    return Container(
        child: GestureDetector(
      onTap: () => {
        _setAge(),
        print('trailing: ${record.agepersonne}'),
      },
      child: Container(
        child: Icon(Icons.add_circle),
      ),
    ));
  }

  void _setAge() {
    //final record = Record.fromSnapshot(data);
    setState(() {
      this.record.agepersonne++;
    });

    print('setAge: ${this.record.agepersonne.toString()}');
  }
}
