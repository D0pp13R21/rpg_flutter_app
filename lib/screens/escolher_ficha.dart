import 'package:flutter/material.dart';
import '../data/fichas_data.dart';
import '../data/jogador_data.dart';
import 'ficha_jogador.dart';

class EscolherFichaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escolha sua Ficha')),
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
              trailing: Icon(Icons.check),
              onTap: () async {
                JogadorFicha novaFicha = JogadorFicha(
                  nome: ficha.nome,
                  classe: ficha.classe,
                  raca: ficha.raca,
                  imagem: ficha.imagem,
                  historia: ficha.historia,
                  atributos: ficha.atributos,
                );

                await JogadorData.salvarFicha(novaFicha);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FichaJogadorPage()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
