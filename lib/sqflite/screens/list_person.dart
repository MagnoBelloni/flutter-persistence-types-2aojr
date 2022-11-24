import 'package:flutter/material.dart';
import 'package:persistence_types/sqflite/daos/person_dao.dart';
import 'package:persistence_types/sqflite/models/person.dart';
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

  List persons = [];

  @override
  void initState() {
    super.initState();
    getAllPersons();
  }

  getAllPersons() async {
    List<Person> result = await PersonDAO().readAll();
    setState(() {
      persons = result;
    });
  }

  insertPerson(Person person) async {
    int id = await PersonDAO().insertPerson(person);
    setState(() {
      person.id = id;
      persons.add(person);
    });
  }

  deletePerson(int id) async {
    await PersonDAO().deletePerson(id);

    setState(() {
      final personInArray = persons.firstWhere((e) => e.id == id,
          orElse: () => Person('naoencontrado', 'naoencontrado'));

      if (personInArray.id == 0) {
        return;
      }

      persons.removeAt(persons.indexOf(personInArray));
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
                  .then((person) => {
                        if (person != null) {insertPerson(person)}
                      });
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
    Person person = persons[index];
    return Padding(
      padding: cardPadding,
      child: Container(
        decoration: cardBoxStyle(),
        child: ListTile(
          leading: Text(person.id.toString()),
          title: Text(person.firstName),
          subtitle: Text(person.lastName),
          onLongPress: () {
            deletePerson(person.id!);
          },
        ),
      ),
    );
  }
}
