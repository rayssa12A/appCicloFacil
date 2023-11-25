import 'package:flutter/material.dart';
import 'menu.dart';
import 'homepage.dart';

class Definicoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Navegar para a HomePage e bloquear a ação padrão de voltar
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Definições',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(0xFF750815),
            iconTheme: IconThemeData(
              color: Colors.white, // Defina a cor da seta de voltar aqui
            ),
          ),
          body: Center(
            child: Text('Conteúdo da tela de definições'),
          ),
          bottomNavigationBar: Menu(),
          backgroundColor: Color(0xFFFFD9DD),
        ));
  }
}
