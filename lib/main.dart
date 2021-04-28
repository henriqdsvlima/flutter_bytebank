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
        TransferItem(Transfer(100.0, 1001)),
        TransferItem(Transfer(100.0, 1001)),
        TransferItem(Transfer(100.0, 1001)),
        TransferItem(Transfer(100.0, 1001)),
      ], //<Widget>[]
    );
  }
}

class TransferItem extends StatelessWidget {
  Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.transferValue.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ), //ListTile
    ); //Card
  }
}

class Transfer {
  final double transferValue;
  final int accountNumber;

  Transfer(this.transferValue, this.accountNumber);
}
