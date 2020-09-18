import 'package:flutter/material.dart';
import 'package:forms_restapi/dynamic_list.dart';
import 'package:forms_restapi/fetch_data.dart';
import 'package:forms_restapi/fetch_firestore.dart';
import 'package:forms_restapi/mycustomform.dart';

class HomePage extends StatefulWidget {
  //final List<Pokemon> pokemons;

  //PokemonList(this.pokemons);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home Page',
          ),
        ),
        body: Column(children: [
          RaisedButton(
            onPressed: () => _navigateToCustomForm(context),
            child: Text('Custom Form', style: TextStyle(fontSize: 20)),
          ),
          RaisedButton(
            onPressed: () => _navigateToFetchData(context),
            child: Text('Fetch Data', style: TextStyle(fontSize: 20)),
          ),
          RaisedButton(
            onPressed: () => _navigateToFetchFirestore(context),
            child: Text('Fetch Firestore', style: TextStyle(fontSize: 20)),
          ),
          RaisedButton(
            onPressed: () => _navigateToDynamicList(context),
            child: Text('Dynamic List', style: TextStyle(fontSize: 20)),
          ),
        ]));
  }

  void _navigateToCustomForm(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyCustomForm(),
        ));
  }

  void _navigateToFetchData(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FetchData(context),
        ));
  }

  void _navigateToFetchFirestore(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FetchFirestore(),
        ));
  }

  void _navigateToDynamicList(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListDisplay(),
        ));
  }
}
