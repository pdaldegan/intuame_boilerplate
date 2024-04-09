import 'package:flutter/material.dart';
import '../widgets/mydrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class inputPage extends StatelessWidget {

  final AppLocalizations localizations;
  
  const inputPage({super.key, required  this.localizations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.screenheaderInput),
      ),
      drawer: MyDrawer(key: null, localizations: localizations, onItemSelected: () => {}),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/news');
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}