import 'package:flutter/material.dart';
import 'menu.dart';
import 'homepage.dart'; // Importe a HomePage


class Registro extends StatelessWidget {
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
              'Registro',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(0xFF750815),
            iconTheme: IconThemeData(
              color: Colors.white, // Defina a cor da seta de voltar aqui
            ),
          ),
          body: 
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              RowWithCircles(),
              RowWithCircles(),
              RowWithCircles(),
            ],
                      
          ),

          bottomNavigationBar: Menu(),
          backgroundColor: Color(0xFFFFD9DD),
        ));
  }
}

class RowWithCircles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleWidget(),
        CircleWidget(),
        CircleWidget(),
        CircleWidget(),
        CircleWidget(),
      ],
    );
  }
}

class CircleWidget extends StatefulWidget {
  @override
  _CircleWidgetState createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> {
  Color _circleColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _circleColor = _circleColor == Colors.blue ? Colors.white : Colors.blue;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _circleColor,
        ),
      ),
    );
  }
}