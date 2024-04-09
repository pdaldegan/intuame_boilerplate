import 'package:flutter/material.dart';
import '../widgets/mydrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class resultsPage extends StatelessWidget {

  final AppLocalizations localizations;
  
  const resultsPage({super.key, required  this.localizations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.screenheaderResults),
      ),
      drawer: MyDrawer(key: null, localizations: localizations, onItemSelected: () => {}),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/input');
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}