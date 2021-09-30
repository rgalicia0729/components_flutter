import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheck(),
            Expanded(
              child: _crearImagen() 
            )
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      min: 10.0,
      max: 400.0,
      value: _valorSlider, 
      onChanged: _bloquearSlider ? null : (valor) {
        setState(() {
          _valorSlider = valor;
        });
      }
    );
  }

  Widget _crearCheck() {
    // SwitchListTile -> Similar a CheckboxListTile
    return CheckboxListTile(
      title: Text('Bloquerar slider'),
      value: _bloquearSlider, 
      onChanged: (value) {
        setState(() {
          _bloquearSlider = value ?? false;
        });
      }
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      width: _valorSlider,
      fit: BoxFit.contain,
      placeholder: AssetImage('assets/loading.gif'), 
      image: NetworkImage('http://pngimg.com/uploads/batman/batman_PNG111.png'),
    );
    
    
  }
}