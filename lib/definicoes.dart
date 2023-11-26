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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextContainer('Usuário'),
              buildTextContainer('Análise'),
              buildTextContainer('Lembrete'),
              buildTextContainer('Personalizar'),
            ],
          ),
        ),
        bottomNavigationBar: Menu(),
        backgroundColor: Color(0xFFFFD9DD),
      ),
    );
  }

  Widget buildTextContainer(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 238, 238, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 45,
          color: Color.fromRGBO(117, 8, 21, 1),
        ),
      ),
    );
  }
}
