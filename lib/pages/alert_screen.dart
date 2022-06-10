import 'dart:io';

import 'package:clean_architecture/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              title: const Text('titulo'),
              content: Column(mainAxisSize: MainAxisSize.min, children: const [
                Text('Este es el contenido de la alerta'),
                SizedBox(height: 10),
                FlutterLogo(size: 100)
              ]),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Aceptar',
                        style: TextStyle(color: Colors.red))),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'))
              ]);
        });
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        //Nos va a permitir cerrar el dialogo cuendo hacemos click en la sombra
        barrierDismissible: false,
        context: context,
        //el builder no es mas que un codigo que construye un widget
        builder: (context) {
          return AlertDialog(
              elevation: 5,
              title: const Text('titulo'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: Column(mainAxisSize: MainAxisSize.min, children: const [
                Text('Este es el contenido de la alerta'),
                SizedBox(height: 10),
                FlutterLogo(size: 100)
              ]),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar'))
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(
            // onPressed: () => displayDialogAndroid(context),
            onPressed: () => Platform.isAndroid
                ? displayDialogAndroid(context)
                : displayDialogIOS(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text('Mostrar alerta', style: TextStyle(fontSize: 20)),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.primary,
          child: const Icon(Icons.close),
          onPressed: () {
            //Para cerrar la ventana y volver a la anterior
            //Es decir que redirecione a la ultima pantalla que esta en el arbol de widget
            Navigator.pop(context);
          },
        ));
  }
}
