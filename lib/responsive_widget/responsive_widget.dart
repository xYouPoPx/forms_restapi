import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget veryLargeScreen;
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveWidget({Key key, this.veryLargeScreen, this.largeScreen, this.mediumScreen, this.smallScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Returns the widget which is more appropriate for the screen size
    return LayoutBuilder(builder: (context, constraints) {
      if (MediaQuery.of(context).size.width > 0) {
        print((MediaQuery.of(context).size.width));
      }
      if (constraints.maxWidth >= 901) {
        return veryLargeScreen;
      } else if (constraints.maxWidth > 800 && constraints.maxWidth <= 900) {
        return largeScreen;
      } else if (constraints.maxWidth >= 520 && constraints.maxWidth <= 800) {
        //if medium screen not available, then return large screen
        return mediumScreen;
      } else {
        //if small screen implementation not available, then return large screen
        return smallScreen;
      }
    });
  }

  //Making these methods static, so that they can be used as accessed from other widgets
  //Large screen is any screen whose width is more than 1200 pixels
  static bool isVeryLargeScreen(BuildContext context) {
    print(context.size.width);

    return MediaQuery.of(context).size.width > 901;
  }

  //Large screen is any screen whose width is more than 1200 pixels
  static bool isLargeScreen(BuildContext context) {
    print(context.size.width);

    return MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.width <= 899;
  }

  //Medium screen is any screen whose width is less than 1200 pixels,
  //and more than 800 pixels
  static bool isMediumScreen(BuildContext context) {
    print(context.size.width);

    return MediaQuery.of(context).size.width >= 520 && MediaQuery.of(context).size.width < 800;
  }

  //Small screen is any screen whose width is less than 800 pixels
  static bool isSmallScreen(BuildContext context) {
    print(context.size.width);

    return MediaQuery.of(context).size.width < 350;
  }
}
