import 'package:flutter/material.dart';

class NoEncontradoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404')
      ),
      body: Center(
        child: Text('404 No encontrado'),
      ),
    );
  }
}