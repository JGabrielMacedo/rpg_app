import 'package:flutter/material.dart';
import 'package:rpg_app/src/view/dashboard_view/components/dashboard_app_bar_view.dart';
import 'package:rpg_app/src/view/dashboard_view/dashboard_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPG App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(body: DashboardView()),
      debugShowCheckedModeBanner: false,
    );
  }
}
