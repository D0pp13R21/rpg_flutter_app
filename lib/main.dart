import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPG App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          HomePage(), // Agora inicia na tela de escolha entre Mestre e Jogador
    );
  }
}
