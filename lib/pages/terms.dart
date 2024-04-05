import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class termsPage extends StatelessWidget {
  const termsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //    title: const Text('News'),
      //),
      body: Center(
        child: Column(
          children: [
            Container(height: 150,),
            Image.asset('assets/images/logo.png'),
            const Text("\n\nYou have to agree with my terms in order to continue using this app.\n\n",
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/news');
                    },
                  child: const Text("Agree"),
                  ),
                ),
                const SizedBox(width: 10), // Add spacing between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  child: const Text("Don't Agree"),
                  ),
                ),
              ],
            ),
          ],
        ),
    ),
    );
  }
}