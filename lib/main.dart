import 'package:flutter/material.dart';
import 'package:hello_world/screens/Transfer/List.dart';

void main() => runApp(ByteBankApp()); //Material App

// StatefulWidget - não conseguimos modificar o conteúdo entao a partir do momento em que é construido, não é possivel modificar o conteúdo;
//StatelessWidget - teremos a capacidade de modificar o conteúdo do widget de maneira dinamica;

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferList(),
      //inseri para estudo
      // theme: ThemeData(
      //   primaryColor: Colors.green[900],
      //   accentColor: Colors.blueAccent[700],
      //   buttonTheme: ButtonThemeData(
      //     buttonColor: Colors.blueAccent[700],
      //     textTheme: ButtonTextTheme.primary,
      //   ),
      // ),
    );
  }
}

// ignore: must_be_immutable
