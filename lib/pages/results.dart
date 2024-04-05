import 'package:flutter/material.dart';
import '../widgets/MyDrawer.dart';

class resultsPage extends StatelessWidget {
  const resultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      drawer: MyDrawer(key: null, onItemSelected: () => {}),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}