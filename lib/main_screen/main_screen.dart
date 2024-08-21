import 'package:flutter/material.dart';
import 'components/body.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Serba Guna',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: const Body(),
    );
  }
}
