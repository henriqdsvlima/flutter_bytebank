import 'package:flutter/material.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() => runApp(ByteBankApp()); //Material App

//StatelessWidget - não conseguimos modificar o conteúdo entao a partir do momento em que é construido, não é possivel modificar o conteúdo;
//StatefulWidget - teremos a capacidade de modificar o conteúdo do widget de maneira dinamica;

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ), //Scaffold
    ); //MaterialApp
  }
}

class Transfer {
  final double transferValue;
  final int accountNumber;

  Transfer(this.transferValue, this.accountNumber);
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

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ), //AppBar
      body: Column(
        children: <Widget>[
          TransferItem(Transfer(1990.0, 1001)),
          TransferItem(Transfer(122.0, 1001)),
          TransferItem(Transfer(133.0, 1001)),
          TransferItem(Transfer(144.0, 1001)),
        ], //<Widget>[]
      ), //Column
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add)), // FloatingActionButton
    );
  }
}

class TransferForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferências'),
          backgroundColor: Color(0xff25D366),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 20.0,
                ), //TextStyle
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Número da Conta',
                  hintText: '0000',
                ), //Inputdecoration
                keyboardType: TextInputType.number,
              ), //TextField
            ), //Padding
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 20.0,
                ), //TextStyle
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0000',
                ), //Inputdecoration
                keyboardType: TextInputType.number,
              ), //TextField
            ), //Padding,
            RaisedButton(
              child: Text('Confirmar'),
            )
          ], //<Widget>[]
        )); // Column, Scaffold
  }
}
