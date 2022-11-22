import 'package:flutter/material.dart';
import 'package:persistence_types/firebase/screens/list_car.dart';
import 'package:persistence_types/floor/screens/list_book.dart';
import 'package:persistence_types/sqflite/screens/list_person.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreenWidget(),
        "/person": (context) => const ListPersonWidget(),
        "/books": (context) => const ListBookWidget(),
        "/cars": (context) => const ListCarWidget(),
      },
    );
  }
}
