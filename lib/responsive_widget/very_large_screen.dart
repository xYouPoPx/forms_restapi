import 'package:flutter/material.dart';

class VeryLargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('VeryLargeScreen');

    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[addBackground(), addWelcomeText(context)],
      ),
    );
  }

  //Adds background Image
  Widget addBackground() {
    return FractionallySizedBox(
      alignment: Alignment.centerRight, //to keep images aligned to right
      widthFactor: .6, //covers about 60% of the screen width
      child: Image.network(
        'https://cdn.pixabay.com/photo/2016/11/29/05/45/astronomy-1867616_960_720.jpg',
        scale: .85,
      ),
    );
  }

  //Adds welcome text
  Widget addWelcomeText(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft, //text aligned to left side
      widthFactor: .6, //covers about half of the screen
      child: Padding(
        padding: EdgeInsets.only(left: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'very large screen',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: Colors.blue,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Welcome',
                  style: TextStyle(fontSize: 60, color: Colors.blue),
                  children: [TextSpan(text: 'testspam', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.black54))]),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text('text'),
            ),
            SizedBox(
              height: 40,
            ), //Give some spacing
            // EmailBox()
          ],
        ),
      ),
    );
  }
}
