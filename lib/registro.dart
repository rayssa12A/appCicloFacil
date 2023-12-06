import 'package:flutter/material.dart';
import 'menu.dart';
import 'homepage.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RowWithCircles(
              circleNumbers: [1, 2, 3, 4, 5],
              circleLegend: 'Intensidade menstrual',
            ),
            RowWithCircles(
              circleNumbers: [1, 2, 3, 4, 5],
              circleLegend: 'Cólica Menstrual',
            ),
            RowWithCircles(
              circleNumbers: [1, 2, 3, 4, 5],
              circleLegend: 'Dor nos seios',
            ),
            SizedBox(
              height:
                  10, // Adiciona um espaço entre as últimas RowWithCircles e o botão de salvar
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Salvar'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF750815), // Cor do botão
                onPrimary: Colors.white, // Cor do texto do botão
              ),
            )
          ],
        ),
        bottomNavigationBar: Menu(),
        backgroundColor: Color(0xFFFFD9DD),
      ),
    );
  }
}

class RowWithCircles extends StatefulWidget {
  final List<int> circleNumbers;
  final String circleLegend;

  RowWithCircles({required this.circleNumbers, required this.circleLegend});

  @override
  _RowWithCirclesState createState() => _RowWithCirclesState();
}

class _RowWithCirclesState extends State<RowWithCircles> {
  int? selectedCircle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            widget.circleLegend,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF750815),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int number in widget.circleNumbers)
              CircleWidget(
                number: number,
                isSelected: selectedCircle == number,
                onSelect: () {
                  setState(() {
                    // Toggle selection
                    selectedCircle =
                        selectedCircle == number ? null : number;
                  });
                },
              ),
          ],
        ),
      ],
    );
  }
}

class CircleWidget extends StatelessWidget {
  final int number;
  final bool isSelected;
  final VoidCallback onSelect;

  CircleWidget({
    required this.number,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Color(0xFFF5112C) : Color(0xFF750815),
            border: Border.all(
              color: Color(0xFFF5112C), // Cor da borda
              width: 3, // Largura da borda
            )),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
