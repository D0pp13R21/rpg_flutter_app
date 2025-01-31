import 'package:flutter/material.dart';
import 'package:rpg_flutter_app/data/bestiario_data.dart'; // Importando os dados do bestiario
import 'package:rpg_flutter_app/screens/monstro_detalhado.dart'; // Importando a nova tela detalhada

class BestiarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bestiário')),
      body: ListView.builder(
        itemCount: listaDeMonstros.length,
        itemBuilder: (context, index) {
          final monstro = listaDeMonstros[index];

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(monstro.imagem),
              ),
              title: Text(monstro.nome,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(monstro.tipo),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MonstroDetalhadoPage(monstro: monstro),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
