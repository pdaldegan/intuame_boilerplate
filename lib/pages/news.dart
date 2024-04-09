import 'package:flutter/material.dart';
import '../widgets/mydrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class newsPage extends StatelessWidget {

  final AppLocalizations localizations;
  
  const newsPage({super.key, required  this.localizations});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.screenheaderNews),
      ),
      drawer: MyDrawer(key: null, localizations: localizations, onItemSelected: () => {}),

      body: Center(
        child: Column(

          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text("Coming soon..."),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text("Implementation of Firebase connection to News server, and refined layout."),
            ),
            
          ],
        ),
    ),
    );
  }
}