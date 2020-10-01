import 'package:flutter/material.dart';
import 'package:forms_restapi/responsive_widget/large_screen.dart';
import 'package:forms_restapi/responsive_widget/responsive_widget.dart';
import 'package:forms_restapi/responsive_widget/small_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}