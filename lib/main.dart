import 'package:flutter/material.dart';
import 'package:flutter/src/material/list_tile.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: TransferList(), //Column
        appBar: AppBar(
          title: Text('Transferências'),
        ), //AppBar
        //Scaffold
    )
    ); //Material App

//StatelessWidget - não conseguimos modificar o conteúdo entao a partir do momento em que é construido, não é possivel modificar o conteúdo;
//StatefulWidget - teremos a capacidade de modificar o conteúdo do widget de maneira dinamica;

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TransferItem(Transfer(1990.0, 1001)),
          TransferItem(Transfer(122.0, 1001)),
          TransferItem(Transfer(133.0, 1001)),
          TransferItem(Transfer(144.0, 1001)),
        ], //<Widget>[]
      ),// Column
       floatingActionButton: FloatingActionButton(child: Icon(Icons.add)), // FloatingActionButton
      ),
    )
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

class TransferForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
