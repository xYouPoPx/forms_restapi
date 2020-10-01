import 'package:flutter/material.dart';

class MediumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MediumScreen');

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'medium screen',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.blue,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Welcome',
                  style: TextStyle(fontSize: 40, color: Colors.blue),
                  children: [TextSpan(text: 'textspan', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black54))]),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                'https://cdn.pixabay.com/photo/2016/11/29/05/45/astronomy-1867616_960_720.jpg',
                scale: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text('subscribe'),
            ),
            SizedBox(
              height: 30,
            ),
            // EmailBox(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
