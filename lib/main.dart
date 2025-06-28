import 'package:apps_collection/tic_tac_toe/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ecommers/providers/product_provider.dart';
import 'package:apps_collection/auth/registration_provider.dart';

import 'news/providers/news_provider.dart';
import 'random_users/presentation/providers/random_user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => registrationProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => NewsProvider()),
        ChangeNotifierProvider(create: (context) => RandomUserProvider()),
        ChangeNotifierProvider(create: (context) => GameProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const HomePage(),
      title: "Flutter Apps Collection",
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
