import 'package:flutter/material.dart';
import '../widgets/MyDrawer.dart';

class newsPage extends StatelessWidget {
  const newsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      drawer: MyDrawer(key: null, onItemSelected: () => {}),
      body: const Text("NEWS"),
    );
  }
}