import 'package:diamond_catalog/view/screens/cart_page.dart';
import 'package:diamond_catalog/view/screens/filter_page.dart';
import 'package:diamond_catalog/view/screens/result_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String filter = '/filter';
  static const String cart = '/cart';
  static const String filterItems = '/FilterItems';
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case filter:
        return MaterialPageRoute(
          builder: (context) => const FilterPage(),
        );
      case cart:
        return MaterialPageRoute(
          builder: (context) => const CartPage(),
        );
      case filterItems:
        return MaterialPageRoute(
          builder: (context) => const ResultPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Not Found'),
            ),
          ),
        );
    }
  }
}
