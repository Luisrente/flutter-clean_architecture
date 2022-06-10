import 'package:clean_architecture/theme/app_theme.dart';
import 'package:clean_architecture/widget/widget.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //El appbar no puede estar con las dimensiones constantes ya que
        //eso depende del dispositivo
        appBar: AppBar(title: const Text('Card Widget')),
        body: ListView(
            //no puede se una constante ya que las column dependen de las dimenciones del dispositivo
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: const [
              CustomCardType1(),

              //Para añadir separacion entre las targetas
              SizedBox(
                height: 10,
              ),
              CustomCardType2(
                  name: 'Paisaje',
                  imageUrl:
                      'https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
              SizedBox(height: 10),

              CustomCardType2(
                  name: 'Hola',
                  imageUrl:
                      'https://fotoarte.com.uy/wp-content/uploads/2019/03/Landscape-fotoarte.jpg'),

              SizedBox(height: 100),
            ]));
  }
}
