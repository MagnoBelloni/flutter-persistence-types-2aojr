import 'package:flutter/material.dart';
import 'package:persistence_types/sqflite/screens/add_person.dart';
import 'package:persistence_types/utils/customWidgets.dart';

import '../../utils/customStyles.dart';

class ListPersonWidget extends StatefulWidget {
  const ListPersonWidget({super.key});

  @override
  State<ListPersonWidget> createState() => _ListPersonWidgetState();
}

class _ListPersonWidgetState extends State<ListPersonWidget> {
  final title = const Text("Pessoas");
  final addRoute = const AddPersonWidget();

  List persons = [
    {}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title, actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => addRoute));
            },
            icon: addIcon)
      ]),
      body: ListView.separated(
          itemBuilder: (context, index) => _buildItem(index),
          separatorBuilder: (context, index) => divisorList(),
          itemCount: persons.length),
    );
  }

  Widget _buildItem(int index) {
    return Padding(
      padding: cardPadding,
      child: Container(
          decoration: cardBoxStyle(),
          child: ListTile(
            leading: Text("1"),
            title: Text("Pessoa 1"),
            subtitle: Text("Sobrenome 1"),
            onLongPress: () {
              //delete
            },
          )),
    );
  }
}