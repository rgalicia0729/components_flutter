import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50;
  double _height = 50;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container')
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _cambiarForma,
      ),
    );
  }

  void _cambiarForma() {

    final random = Random();

    setState(() {
      this._width = random.nextInt(300).toDouble();
      this._height = random.nextInt(300).toDouble();
      this._borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
      this._color = Color.fromARGB(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        1
      );
    });

  }

}