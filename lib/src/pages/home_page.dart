import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista()
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {

        return ListView(
          children: _items(snapshot.data ?? [], context),
        );
      },
    );
  }

  List<Widget> _items(List<dynamic> data, BuildContext context) {
    return data.map((opcion) => Column(
      children: [
        ListTile(
          leading: getIcon(opcion['icon']),
          title: Text(opcion['texto']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: (){
            Navigator.pushNamed(context, opcion['ruta']);
          },
        ),
        Divider()
      ],
    )).toList();
  }
}