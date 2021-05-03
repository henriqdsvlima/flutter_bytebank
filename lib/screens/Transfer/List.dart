import 'package:flutter/material.dart';
import 'package:hello_world/components/TransferItem.dart';
import 'package:hello_world/models/Transfer.dart';

import 'Form.dart';

const _appBarTitle = 'Transferências';

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = [];

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f5),
      appBar: AppBar(
        title: Text(_appBarTitle),
        backgroundColor: Color(0xff8a2be2),
      ),
      body: ListView.builder(
          itemCount: widget._transfers.length,
          itemBuilder: (context, index) {
            final transfers = widget._transfers[index];
            return TransferItem(transfers);
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff8a2be2),
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            // navegou para a pagina do formulario da transferencia ao clicar no FloatingActionButton
            return TransferForm();
          }));
          future.then((transferReceived) {
            Future.delayed(Duration(seconds: 1), () {
              _transferUpdate(transferReceived);
            });
          });
        },
      ),
    );
  }

  void _transferUpdate(Transfer transferReceived) {
    if (transferReceived != null) {
      setState(() {
        widget._transfers.add(transferReceived);
      });
    }
  }
}
