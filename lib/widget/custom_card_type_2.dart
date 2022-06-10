import 'package:clean_architecture/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String? name;

  const CustomCardType2({Key? key, required this.imageUrl, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        //los clipBehavior sirve para cortar los contenidos
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        //Cambiar el color de la Somb(),
        shadowColor: AppTheme.primary.withOpacity(0.5),
        child: Column(children: [
          FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: const AssetImage('assets/jar-loading.gif'),
              width: double.infinity,
              height: 230,
              //La imagen se adapta a todo el tamaño posible
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 300)),
          if (name != null)
            Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.only(right: 20, top: 20, bottom: 10),
                child: Text(name!))
        ]));
  }
}
