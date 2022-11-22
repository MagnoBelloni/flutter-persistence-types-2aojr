import 'package:flutter/material.dart';
import 'package:persistence_types/utils/customWidgets.dart';

class ListItemWidget extends StatelessWidget {
  final String nome;
  final String descricao;
  final String caminhoSvg;
  final String rota;

  const ListItemWidget(this.nome, this.descricao, this.caminhoSvg, this.rota,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: buildSvgIcon(caminhoSvg),
        title: Text(nome),
        subtitle: Text(descricao),
        trailing: const Icon(Icons.navigate_next),
        onTap: () {
          Navigator.pushNamed(context, rota);
        },
      ),
    );
  }
}
