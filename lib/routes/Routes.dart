import 'package:flutter/material.dart';

class RouteHelper {
  RouteHelper._();
  static RouteHelper routeHelper = RouteHelper._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  goToPage(String routeName) {
    navKey.currentState.pushNamed(routeName);
  }

  goToPageRouteWithReplacement(String routeName) {
    navKey.currentState.pushReplacementNamed(routeName);
  }
  goToPageWithReplacement(Widget page) {
    navKey.currentState.pushReplacement(MaterialPageRoute(builder: (con)=>page));
  }

  back() {
    navKey.currentState.pop();
  }
}