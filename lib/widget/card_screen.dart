import 'package:clean_architecture/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      const ListTile(
          leading: Icon(Icons.photo_album_outlined, color: AppTheme.primary),
          title: Text('soy un titulo'),
          subtitle: Text(
              'Irure proident nisi veniam labore id culpa Lorem pariatur nulla aliquip minim mollit. Dolor ut id nulla quis ullamco esse irure cupidatat non sit laborum officia. Voluptate do exercitation dolor ipsum commodo duis culpa consectetur ea consequat laborum proident.')),
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Row(
            //Para cambiar de pocision los botones
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Cancel'),
                //Color del boton
              ),
              TextButton(onPressed: () {}, child: const Text('Ok')),
            ]),
      )
    ]));
  }
}
