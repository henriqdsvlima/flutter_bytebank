import 'package:flutter/material.dart';
import 'package:flutter/src/material/list_tile.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('199 reais'),
            subtitle: Text('2000'),
          ), //ListTile
        ), //Card
        appBar: AppBar(
          title: Text('Transferências'),
        ), //AppBar
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ), // FloatingActionButton
      ), //Scaffold
    )); //Material App
