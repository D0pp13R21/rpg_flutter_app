import 'package:flutter/material.dart';
import 'mestre/mestre_home.dart';
import 'jogador/jogador_home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escolha seu Papel')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MestreHomePage()),
                );
              },
              child: Text('Sou o Mestre'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JogadorHomePage()),
                );
              },
              child: Text('Sou um Jogador'),
            ),
          ],
        ),
      ),
    );
  }
}
