import 'package:flutter/material.dart';
import '../data/jogador_data.dart';
import 'escolher_ficha.dart';

class FichaJogadorPage extends StatefulWidget {
  @override
  _FichaJogadorPageState createState() => _FichaJogadorPageState();
}

class _FichaJogadorPageState extends State<FichaJogadorPage> {
  JogadorFicha? ficha;

  @override
  void initState() {
    super.initState();
    _carregarFicha();
  }

  Future<void> _carregarFicha() async {
    ficha = await JogadorData.carregarFicha();
    setState(() {});
  }

  Future<void> _editarFicha() async {
    TextEditingController nomeController =
        TextEditingController(text: ficha?.nome);
    TextEditingController historiaController =
        TextEditingController(text: ficha?.historia);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Ficha'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: nomeController,
                  decoration: InputDecoration(labelText: 'Nome')),
              TextField(
                  controller: historiaController,
                  decoration: InputDecoration(labelText: 'História')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                ficha?.nome = nomeController.text;
                ficha?.historia = historiaController.text;
                await JogadorData.salvarFicha(ficha!);
                setState(() {});
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (ficha == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Ficha do Jogador')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Ficha do Jogador')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                  radius: 60, backgroundImage: AssetImage(ficha!.imagem)),
            ),
            SizedBox(height: 16),
            Text('Nome: ${ficha!.nome}', style: TextStyle(fontSize: 20)),
            Text('Classe: ${ficha!.classe} - Raça: ${ficha!.raca}',
                style: TextStyle(fontSize: 18)),
            Text('História: ${ficha!.historia}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _editarFicha,
              child: Text('Editar Ficha'),
            ),
            ElevatedButton(
              onPressed: () async {
                await JogadorData.limparFicha();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EscolherFichaPage()));
              },
              child: Text('Escolher outra Ficha'),
            ),
          ],
        ),
      ),
    );
  }
}
