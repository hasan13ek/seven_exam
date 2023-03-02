import 'package:flutter/material.dart';
import 'package:seven_exam/ui/splash/splash_screen.dart';
import 'package:seven_exam/ui/tab_box/tab_box.dart';
import 'package:seven_exam/utils/constants.dart';


class MyRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case noInternetRoute:
      //   return navigateTo(NoInternetScreen(voidCallback: settings.arguments as VoidCallback));
      case tabBox:
        return navigateTo(TabBox());
      case splashPage:
        return navigateTo(SplashScreen());
      // case loginPage:
      //   return navigateTo(LoginScreen());
      default:
        return navigateTo(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

MaterialPageRoute navigateTo(Widget widget) => MaterialPageRoute(
  builder: (context) => widget,
);
