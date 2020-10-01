import 'package:flutter/material.dart';

class DynamicLayout extends StatefulWidget {
  //final List<Pokemon> pokemons;

  //PokemonList(this.pokemons);
  @override
  _DynamicLayoutState createState() => _DynamicLayoutState();
}

class _DynamicLayoutState extends State<DynamicLayout> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    print(media.toString());

    return Scaffold(
      appBar: AppBar(),
      body: media.size.width < 600
          ? Drawer(
              child: Text('Drawer'),
            )
          : Row(
              children: <Widget>[
                media.size.width > 600
                    ? Flexible(
                        flex: 1,
                        child: Text('Flexible in row'),
                      )
                    : Container(),
                Flexible(
                  flex: 3,
                  child: Center(
                      child: Text(
                    "Size ${media.size.width} * ${media.size.height}",
                    style: Theme.of(context).textTheme.headline6,
                  )),
                ),
              ],
            ),
    );
    // return Scaffold(
    //   appBar: AppBar(),
    //   body: Column(
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           _buildExpanded(),
    //           _buildFlexible(),
    //         ],
    //       ),
    //       Row(
    //         children: <Widget>[
    //           _buildExpanded(),
    //           _buildExpanded(),
    //         ],
    //       ),
    //       Row(
    //         children: <Widget>[
    //           _buildFlexible(),
    //           _buildFlexible(),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget _buildOrientationBuilder(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      _buildGridView(context, orientation);
    });
  }

  Widget _buildGridView(BuildContext context, Orientation orientation) {
    return GridView.count(crossAxisCount: orientation == Orientation.portrait ? 1 : 2);
  }

  Widget _buildFlexible() {
    return Flexible(
      child: Container(
        color: Colors.green,
        child: Text(
          "Flexible",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget _buildExpanded() {
    return Flexible(
      child: Container(
        color: Colors.green,
        child: Text(
          "Expanded",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
