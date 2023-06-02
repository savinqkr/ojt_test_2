import 'package:flutter/material.dart';
import 'package:ojt_test_2/common/models/route_configuration.dart';
import 'package:ojt_test_2/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'OJT TEST 2',
      debugShowCheckedModeBanner: false,
      // Routing
      initialRoute: HomeScreen.route,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
