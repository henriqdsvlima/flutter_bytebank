import 'package:flutter/material.dart';
import 'package:flutter/src/material/list_tile.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: TransferList(), //Column
        appBar: AppBar(
          title: Text('Transferências'),
        ), //AppBar
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ), // FloatingActionButton
      ), //Scaffold
    )); //Material App

//StatelessWidget - não conseguimos modificar o conteúdo entao a partir do momento em que é construido, não é possivel modificar o conteúdo;
//StatefulWidget - teremos a capacidade de modificar o conteúdo do widget de maneira dinamica;

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransferItem('100.0', '1000'),
        TransferItem('200.0', '2000'),
        TransferItem('300.0', '3000'),
        TransferItem('400.0', '4000'),
      ], //<Widget>[]
    );
  }
}

class TransferItem extends StatelessWidget {
  final String transferValue;
  final String accountNumber;

  TransferItem(this.transferValue, this.accountNumber);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transferValue),
        subtitle: Text(accountNumber),
      ), //ListTile
    ); //Card
  }
}
