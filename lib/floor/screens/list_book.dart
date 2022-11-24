import 'package:flutter/material.dart';
import 'package:persistence_types/floor/daos/book_dao.dart';
import 'package:persistence_types/floor/database/database.dart';
import 'package:persistence_types/floor/models/book.dart';
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

  BookDAO? dao;
  List books = [];

  @override
  void initState() {
    super.initState();
    getAllBooks();
  }

  getAllBooks() async {
    if(dao == null){
      final database = await $FloorAppDatabase
          .databaseBuilder("book_floor_database.db")
          .build();

      dao = database.bookDAO;
    }

    if (dao != null) {
      final result = await dao!.findAllBooks();

      if (result.isNotEmpty) {
        setState(() {
          books = result;
        });
      }
    }
  }

  insertBook(Book book) async {
    final id = await dao!.insertBook(book);

    setState(() {
      book.id = id;
      books.add(book);
    });
  }

  deleteBook(int id) async {
    final bookInArray = books.firstWhere((e) => e.id == id,
        orElse: () => Book('naoencontrado', 'naoencontrado'));

    if (bookInArray.id == 0) {
      return;
    }

    await dao!.deleteBook(bookInArray!);

    setState(() {
      books.removeAt(books.indexOf(bookInArray));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title, actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => addRoute))
                  .then((book) => {
                        if (book != null) {insertBook(book)}
                      });
              ;
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
    Book book = books[index];

    return Padding(
      padding: cardPadding,
      child: Container(
          decoration: cardBoxStyle(),
          child: ListTile(
            leading: Text(book.id.toString()),
            title: Text(book.name),
            subtitle: Text(book.description),
            onLongPress: () {
              deleteBook(book.id!);
            },
          )),
    );
  }
}
