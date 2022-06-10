import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatars'), actions: [
        Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.indigo[900],
            ))
      ]),
      body: const Center(
          child: CircleAvatar(
        maxRadius: 100,
        backgroundImage: NetworkImage(
            'http://c.files.bbci.co.uk/140BA/production/_113760128_mediaitem113760127.jpg'),
      )),
    );
  }
}
