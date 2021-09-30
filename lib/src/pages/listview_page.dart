import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = [];
  bool _isLoading = false;
  int _ultimoItem = 0;

  @override
  void initState() {
    super.initState();

     _agregarDiesItems();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      ),
    );
  }

  Widget _crearLista() {
    final listViewBuilder = ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index) {
        final _indexImage = _listaNumeros[index];

        return FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://picsum.photos/id/$_indexImage/500/300')
        );
      }
    );

    return RefreshIndicator(
      child: listViewBuilder,
      onRefresh: _obtenerPaginaUno,
    );
  }

  Future<Null> _obtenerPaginaUno() async {
    final duration = new Duration(seconds: 2);
    new Timer(
      duration,
      () {
        _listaNumeros.clear();
        _agregarDiesItems();
      }
    );

    return Future.delayed(duration);
  } 

  void _agregarDiesItems() {
    setState(() {  
      for(int i = 1; i <= 10; i++) {
        _ultimoItem++;
        _listaNumeros.add(_ultimoItem);
      }
    });
  }

  Future _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    return new Timer(
      Duration(seconds: 2),
      () {
        _isLoading = false;
        _scrollController.animateTo(
          _scrollController.position.pixels + 100, 
          duration: Duration(milliseconds: 250), 
          curve: Curves.fastOutSlowIn
        );
        _agregarDiesItems();
      }
    );
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }

}