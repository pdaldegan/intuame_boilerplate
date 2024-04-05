import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import './pages/terms.dart';
import './pages/news.dart';
import './pages/input.dart';
import './pages/results.dart';
import './pages/about.dart';
//import './widgets/MyDrawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intuame Calculator Boilerplate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/news' : (context) => const newsPage(),
        '/input': (context) => const inputPage(),
        '/results': (context) => const resultsPage(),
        '/about': (context) => const aboutPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const termsPage();
  }
}