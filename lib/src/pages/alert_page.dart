import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          onPressed: () => _mostrarAlert(context),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: StadiumBorder()
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  // Metodo para mostrar la alerta
  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.'),
              FlutterLogo(size: 100)
            ],
          ),
          actions: <TextButton>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(), 
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: () {}, 
            )
          ],
        );
      }
    );
  }
}