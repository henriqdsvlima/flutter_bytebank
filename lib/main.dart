import 'package:flutter/material.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/material/tabs.dart';
import 'package:flutter/src/widgets/editable_text.dart';

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

  return 'Transferência{valor: $transferValue, numeroConta: $accountNumber '
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
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _accountValueController = TextEditingController();
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
                controller: _accountNumberController,
                style: TextStyle(
                  fontSize: 20.0,
                ), //TextStyle
                decoration: InputDecoration(
                  icon: Icon(IconData(57358, fontFamily: 'MaterialIcons')),
                  labelText: 'Número da Conta',
                  hintText: '0000',
                ), //Inputdecoration
                keyboardType: TextInputType.number,
              ), //TextField
            ), //Padding
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _accountValueController,
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
              onPressed: () {
                controller:
                TextEditingController();
                debugPrint('clicou no evento');
                final int accountNumber = int.tryParse(_accountNumberController.text);
                final double accountValue = double.tryParse(_accountValueController.text);
                if (accountNumber != null && accountValue != null) {
                  final transferSuccess = Transfer(accountValue, accountNumber);
                  debugPrint('$transferSuccess');
                }
              },
            )
          ], //<Widget>[]
        )); // Column, Scaffold
  }
}
