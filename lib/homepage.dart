import 'package:flutter/material.dart';
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
        ]));
  }

  void _navigateToCustomForm(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyCustomForm(),
        ));
  }
}
