import 'package:flutter/material.dart';
import 'package:rpg_flutter_app/data/fichas_data.dart'; // Importando os dados das fichas
import 'package:rpg_flutter_app/screens/ficha_detalhada.dart'; // Importando a nova tela detalhada

class FichasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fichas de Personagens')),
      body: ListView.builder(
        itemCount: listaDeFichas.length,
        itemBuilder: (context, index) {
          final ficha = listaDeFichas[index];

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(ficha.imagem),
              ),
              title: Text(ficha.nome,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${ficha.classe} - ${ficha.raca}'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FichaDetalhadaPage(ficha: ficha),
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
