import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp()); //Material App

// StatefulWidget - não conseguimos modificar o conteúdo entao a partir do momento em que é construido, não é possivel modificar o conteúdo;
//StatelessWidget - teremos a capacidade de modificar o conteúdo do widget de maneira dinamica;

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferList(),
      ),
    );
  }
}

class Transfer {
  final double transferValue;
  final int accountNumber;

  Transfer(this.transferValue, this.accountNumber);

  @override
  String toString() {
    return 'Transferência{valor: $transferValue, numero da conta: $accountNumber';
  }
}

// ignore: must_be_immutable
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
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  final List<Transfer> _transfers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f5),
      appBar: AppBar(
        title: Text('Transferências'),
        backgroundColor: Color(0xff8a2be2),
      ),
      body: ListView.builder(
          itemCount: _transfers.length,
          itemBuilder: (context, index) {
            final transfers = _transfers[index];
            return TransferItem(transfers);
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff8a2be2),
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            // navegou para a pagina do formulario da transferencia ao clicar no FAB
            return TransferForm();
          }));
          future.then((transferReceived) {
            // esperando a função do Future que esta dentro do <trasnfer> acontecer pra fazer essa função de receber a transferencia
            _transfers.add(transferReceived);
          });
        },
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _accountValueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff0f0f5),
        appBar: AppBar(
          title: Text('Criando Transferências'),
          backgroundColor: Color(0xff8a2be2),
        ),
        body: Column(
          children: <Widget>[
            Editor(
                controller: _accountNumberController,
                hint: '0000',
                label: 'Número da Conta:',
                icon: IconData(57358, fontFamily: 'MaterialIcons')),
            Editor(
              controller: _accountValueController,
              hint: '0000',
              label: 'Valor a ser transferido:',
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff8a2be2))),
              child: Text(
                'Confirmar',
              ),
              onPressed: () => _transferCreated(context),
            )
          ],
        ));
  }

  void _transferCreated(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);
    final double accountValue = double.tryParse(_accountValueController.text);
    if (accountNumber != null && accountValue != null) {
      final transferSuccess = Transfer(accountValue, accountNumber);
      Navigator.pop(context,
          transferSuccess); // função que vai tirar a tela da pilha de telas
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  const Editor({this.controller, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
