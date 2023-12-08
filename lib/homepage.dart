import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  int diasMenstruacao = 5; // Substitua pelo valor real da contagem de dias

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Seu ciclo atual',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF750815),
        automaticallyImplyLeading: false, // Remove a seta de voltar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFECEE), // Cor de fundo do círculo
                  border: Border.all(
                    color: Color(0xFFF5112C), // Cor da borda do círculo
                    width: 10.0, // Largura da borda do círculo
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 40, // Ajuste o tamanho do círculo aqui
                  child: Text(
                    diasMenstruacao.toString(),
                    style: TextStyle(
                      color: Colors
                          .black, // Ajuste a cor do texto dentro do círculo
                      fontSize:
                          24, // Ajuste o tamanho do texto dentro do círculo
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 400,
              height: 410, // Ajuste a altura conforme necessário
              decoration: BoxDecoration(
                color: Color(0xFFFFECEE), // Cor de fundo do calendário
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2023, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                headerStyle: HeaderStyle(
                  formatButtonVisible:
                      false, // Se quiser ocultar os botões de formato
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: Colors.white, // Cor do texto do cabeçalho
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.white, // Cor da seta esquerda do cabeçalho
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.white, // Cor da seta direita do cabeçalho
                  ),
                  headerPadding: EdgeInsets.symmetric(vertical: 3),
                  headerMargin: EdgeInsets.only(bottom: 20),
                  formatButtonShowsNext: false,
                  decoration: BoxDecoration(
                    color: Color(0xFFB73A49), // Cor de fundo do cabeçalho
                  ),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFB73A49).withOpacity(0.5),
                  ),
                ),
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Menu(),
      backgroundColor: Color(0xFFFFD9DD), // Cor de fundo da tela
    );
  }
}
