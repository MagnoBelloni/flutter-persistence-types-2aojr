import 'package:flutter/material.dart';
import 'package:persistence_types/components/input_form.dart';
import 'package:persistence_types/utils/customStyles.dart';
import 'package:persistence_types/utils/customWidgets.dart';


class AddCarWidget extends StatefulWidget {
  const AddCarWidget({super.key});

  @override
  State<AddCarWidget> createState() => _AddCarWidgetState();
}

class _AddCarWidgetState extends State<AddCarWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _modelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Novo carro")),
        body: Padding(
            padding: cardPadding,
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputForm(
                          hint: "Nome",
                          label: "Nome",
                          validationMsg: "Insira o nome do carro",
                          controller: _nameController),
                      InputForm(
                          hint: "Modelo",
                          label: "Modelo",
                          validationMsg: "Insira a Modelo do carro",
                          controller: _modelController),
                      Padding(
                          padding: cardPadding,
                          child: ElevatedButton(
                              onPressed: (() {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pop(context);
                                }
                              }),
                              child: salvarText))
                    ]))));
  }
}