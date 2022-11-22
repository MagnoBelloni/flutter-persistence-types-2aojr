import 'package:flutter/material.dart';
import 'package:persistence_types/utils/customWidgets.dart';

import '../components/list_item.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  final title = const Text("Flutter - Persistência");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            ListItemWidget("SQLite", "Lista de Pessoas",
                "assets/sqlite-icon.svg", "/person"),
            ListItemWidget(
                "Floor", "Lista de Livros", "assets/db.svg", "/books"),
            ListItemWidget("Firebase", "Lista de Carros",
                "assets/firebase-icon.svg", "/cars"),
          ],
        ),
      ),
    );
  }
}
