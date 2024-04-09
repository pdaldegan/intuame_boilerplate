import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class termsPage extends StatelessWidget {

  final AppLocalizations localizations;

  termsPage({required this.localizations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //    title: const Text('News'),
      //),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              child: Image.asset('assets/images/logo.png')
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(localizations.terms),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/news', arguments: { 'localizations': AppLocalizations});
                      },
                    child: Text(localizations.agree),
                    ),
                  ),
                  const SizedBox(width: 10), // Add spacing between buttons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    child: Text(localizations.dontagree),
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
    ),
    );
  }
}