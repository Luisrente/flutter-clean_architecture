import 'package:flutter/material.dart';

class ListviewScreen extends StatelessWidget {
  final options = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy'
  ];

  const ListviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Listvywiew Tipo')),
        body: ListView(children: [
          ...options
              .map((game) => ListTile(
                    title: Text(game),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ))
              .toList(),
          Divider(),
        ]));
  }
}
