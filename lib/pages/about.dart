import 'package:flutter/material.dart';
import '../widgets/mydrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class aboutPage extends StatelessWidget {

  final AppLocalizations localizations;
  
  const aboutPage({super.key, required  this.localizations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.screenheaderAbout),
      ),
      drawer: MyDrawer(key: null, localizations: localizations, onItemSelected: () => {}),
      body: Center(
        child: Card(
            borderOnForeground: true,
            child: Text('System language: ${WidgetsBinding.instance.window.locale.languageCode}'),
            )
      ),
    );
  }
}