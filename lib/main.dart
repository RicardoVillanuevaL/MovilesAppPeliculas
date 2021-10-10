import 'package:flutter/material.dart';
import 'package:peliculas/screens/screens.dart';
import 'package:peliculas/startapp/carrusel.dart';
import 'package:peliculas/startapp/loginPage.dart';
import 'package:provider/provider.dart';

import 'package:peliculas/providers/movies_provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'carrosuel',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen(),
        'carrosuel': (_) => CarruselPage(),
        'login': (_) => LoginPage()
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.tealAccent)),
    );
  }
}
