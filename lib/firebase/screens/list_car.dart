import 'package:flutter/material.dart';
import 'package:persistence_types/firebase/screens/add_car.dart';
import 'package:persistence_types/utils/customStyles.dart';
import 'package:persistence_types/utils/customWidgets.dart';

class ListCarWidget extends StatefulWidget {
  const ListCarWidget({super.key});

  @override
  State<ListCarWidget> createState() => _ListCarWidgetState();
}

class _ListCarWidgetState extends State<ListCarWidget> {
  final title = const Text("Carros");
  final addRoute = const AddCarWidget();

  List cars = [
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
          itemCount: cars.length),
    );
  }

  Widget _buildItem(int index) {
    return Padding(
      padding: cardPadding,
      child: Container(
          decoration: cardBoxStyle(),
          child: ListTile(
            leading: Text("1"),
            title: Text("Carro 1"),
            subtitle: Text("Modelo 1"),
            onLongPress: () {
              //delete
            },
          )),
    );
  }
}