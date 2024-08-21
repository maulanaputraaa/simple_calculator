import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
import 'main_feature.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String input = '';
  String result = '';

  void onButtonClick(String value) {
    setState(() {
      if (value == '=') {
        result = input.isEmpty ? '' : calculateResult(input);
      } else if (value == 'C') {
        input = '';
        result = '';
      } else {
        input += value;
      }
    });
  }

  String calculateResult(String input) {
    try {
      input = input.replaceAll('x', '*');
      final expression = Expression.parse(input);
      final evaluator = const ExpressionEvaluator();
      final evalResult = evaluator.eval(expression, {});

      return evalResult.toString();
    } catch (e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar secara dinamis
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Menyesuaikan ukuran font berdasarkan lebar layar
    double fontSize = screenWidth * 0.12;

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.black,
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Text(
              result.isEmpty ? (input.isEmpty ? '' : input) : result,
              style: TextStyle(fontSize: fontSize, color: Colors.white),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        const Divider(height: 1, color: Colors.black),
        Expanded(
          flex: 3, // Menambah fleksibilitas bagian grid agar memaksimalkan ruang
          child: MainFeature(onButtonClick: onButtonClick),
        ),
      ],
    );
  }
}
