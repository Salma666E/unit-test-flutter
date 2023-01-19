
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorites_mdl.dart';
import 'favorites_scrn.dart';
import 'home.dart';

class TestingApp extends StatelessWidget {
  const TestingApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          HomePage.routeName: (context) =>  HomePage(),
          FavoritesPage.routeName: (context) =>  FavoritesPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}