import 'package:flutter/material.dart';
import 'package:hello_world/components/Editor.dart';
import 'package:hello_world/models/Transfer.dart';

const _appBarTitle = 'Criando Transferência';
const _hintFieldValue = '0000';
const _labelFieldValue = 'Número da Conta:';
const _transferFieldValue = 'Valor a ser transferido:';
const _buttonTitle = 'Confirmar';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _accountValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff0f0f5),
        appBar: AppBar(
          title: Text(_appBarTitle),
          backgroundColor: Color(0xff8a2be2),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                  controller: _accountNumberController,
                  hint: _hintFieldValue,
                  label: _labelFieldValue,
                  icon: IconData(57358, fontFamily: 'MaterialIcons')),
              Editor(
                controller: _accountValueController,
                hint: _labelFieldValue,
                label: _transferFieldValue,
                icon: Icons.monetization_on,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff8a2be2))),
                child: Text(
                  _buttonTitle,
                ),
                onPressed: () => _transferCreated(context),
              )
            ],
          ),
        ));
  }

  void _transferCreated(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);
    final double accountValue = double.tryParse(_accountValueController.text);
    if (accountNumber != null && accountValue != null) {
      final transferSuccess = Transfer(accountValue, accountNumber);
      Navigator.pop(context, transferSuccess);
    }
  }
}
