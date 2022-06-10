import 'package:clean_architecture/pages/pages.dart';
import 'package:clean_architecture/router/app_routes.dart';
import 'package:clean_architecture/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        //Configuracion del de colores
        theme: AppTheme.ligthTheme);
  }
}
