import 'package:flutter/material.dart';
import 'package:persistence_types/floor/screens/add_book.dart';
import 'package:persistence_types/utils/customStyles.dart';
import 'package:persistence_types/utils/customWidgets.dart';

class ListBookWidget extends StatefulWidget {
  const ListBookWidget({super.key});

  @override
  State<ListBookWidget> createState() => _ListBookWidgetState();
}

class _ListBookWidgetState extends State<ListBookWidget> {
  final title = const Text("Livros");
  final addRoute = const AddBookWidget();

  List books = [
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
          itemCount: books.length),
    );
  }

  Widget _buildItem(int index) {
    return Padding(
      padding: cardPadding,
      child: Container(
          decoration: cardBoxStyle(),
          child: ListTile(
            leading: Text("1"),
            title: Text("Livro 1"),
            subtitle: Text("Descrição 1"),
            onLongPress: () {
              //delete
            },
          )),
    );
  }
}