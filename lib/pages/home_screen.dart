import 'package:clean_architecture/pages/pages.dart';
import 'package:clean_architecture/router/app_routes.dart';
import 'package:clean_architecture/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Componedntes en flutter')),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  //Para lo iconos utilizamos leading
                  leading: Icon(AppRoutes.menuOptions[index].icon,
                      color: AppTheme.primary),
                  title: Text(AppRoutes.menuOptions[index].name),
                  onTap: () {
                    // final route = MaterialPageRoute(
                    //     builder: (context) => const Listview2Screen());
                    // Navigator.pushReplacement(context, route);
                    Navigator.pushNamed(
                        context, AppRoutes.menuOptions[index].route);
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: AppRoutes.menuOptions.length));
  }
}
