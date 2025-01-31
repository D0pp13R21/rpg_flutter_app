import 'package:flutter/material.dart';
import 'package:rpg_flutter_app/data/itens_data.dart'; // Importando os itens

class ItensPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Itens e Recompensas')),
      body: ListView.builder(
        itemCount: listaDeItens.length,
        itemBuilder: (context, index) {
          final item = listaDeItens[index];
          return ListTile(
            title:
                Text(item.nome, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(item.descricao),
            trailing: Text('${item.valor} moedas',
                style: TextStyle(color: Colors.green)),
            onTap: () {
              // Aqui você pode adicionar uma navegação para ver detalhes do item
            },
          );
        },
      ),
    );
  }
}
