import 'package:flutter/material.dart';

class MainFeature extends StatelessWidget {
  final Function(String) onButtonClick;

  const MainFeature({Key? key, required this.onButtonClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar secara dinamis
    final screenWidth = MediaQuery.of(context).size.width;

    // Menyesuaikan ukuran tombol berdasarkan ukuran layar
    double buttonSize = screenWidth * 0.2;
    double fontSize = buttonSize * 0.4;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonRow(['C', '', '', '/'], buttonSize, fontSize),
        buildButtonRow(['1', '2', '3', 'x'], buttonSize, fontSize),
        buildButtonRow(['4', '5', '6', '-'], buttonSize, fontSize),
        buildButtonRow(['7', '8', '9', '+'], buttonSize, fontSize),
        buildButtonRow(['00', '0', '.', '='], buttonSize, fontSize),
      ],
    );
  }

  Widget buildButtonRow(List<String> texts, double buttonSize, double fontSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: texts.map((text) => buildButton(text, buttonSize, fontSize)).toList(),
    );
  }

  Widget buildButton(String text, double buttonSize, double fontSize) {
    return GestureDetector(
      onTap: () => onButtonClick(text),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(90),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
        ),
      ),
    );
  }
}
