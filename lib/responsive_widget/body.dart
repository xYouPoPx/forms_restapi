import 'package:flutter/material.dart';
import 'package:forms_restapi/responsive_widget/large_screen.dart';
import 'package:forms_restapi/responsive_widget/medium_screen%20.dart';
import 'package:forms_restapi/responsive_widget/responsive_widget.dart';
import 'package:forms_restapi/responsive_widget/small_screen.dart';
import 'package:forms_restapi/responsive_widget/very_large_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
      veryLargeScreen: VeryLargeScreen(),
      mediumScreen: MediumScreen(),
    );
  }
}
