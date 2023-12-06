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
        body: ListView(
          children: [
            buildClickableListItem(context, 'Usuário'),
            buildClickableListItem(context, 'Análise'),
            buildClickableListItem(context, 'Lembrete'),
            buildClickableListItem(context, 'Personalizar'),
          ],
        ),
        bottomNavigationBar: Menu(),
        backgroundColor: Color(0xFFFFD9DD),
      ),
    );
  }

  Widget buildClickableListItem(BuildContext context, String text) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Exemplo: exibir um SnackBar ao clicar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Clicou em $text'),
              ),
            );
          },
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(117, 8, 21, 1),
              ),
            ),
          ),
        ),
        Divider(
          color: Color.fromRGBO(117, 8, 21, 1),
          thickness: 1,
          height: 0,
        ),
      ],
    );
  }
}
