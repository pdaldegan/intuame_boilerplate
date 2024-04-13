import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import './locale_provider.dart'; // Import your LocaleProvider class

class MyDrawer extends StatelessWidget {
  final Function onItemSelected; // Callback to notify selection change
  final AppLocalizations localizations;

  const MyDrawer({Key? key, required this.onItemSelected, required  this.localizations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Provider.of<LocaleProvider>(context).appLocale;
    final _drawerItems = [
            ListTile(
              title: Text(localizations.menuNews),
              dense: true, // Set to true for tighter spacing
              leading: const Icon(Icons.home), // Add leading icon
              trailing: const Icon(Icons.chevron_right), // Add trailing chevron
              onTap: () {
                Navigator.pushReplacementNamed(context, '/news');
              },
            ),
            ListTile(
              title: Text(localizations.menuInput),
              dense: true, // Set to true for tighter spacing
              leading: const Icon(Icons.file_open), // Add leading icon
              trailing: const Icon(Icons.chevron_right), // Add trailing chevron              
              onTap: () {
                Navigator.pushReplacementNamed(context, '/input');
              },
            ),
            ListTile(
              title: Text(localizations.menuResults),
              dense: true, // Set to true for tighter spacing
              leading: const Icon(Icons.calculate_outlined), // Add leading icon
              trailing: const Icon(Icons.chevron_right), // Add trailing chevron
              onTap: () {
                Navigator.pushReplacementNamed(context, '/results');
              },
            ),
            ListTile(
              title: Text(localizations.menuAbout),
              dense: true, // Set to true for tighter spacing
              leading: const Icon(Icons.info), // Add leading icon
              trailing: const Icon(Icons.chevron_right), // Add trailing chevron
              onTap: () {
                Navigator.pushReplacementNamed(context, '/about');
              },
            ),
            const Divider(thickness: 1.0),

            ListTile(
              leading: currentLocale==const Locale('en') ? const Icon(Icons.check_circle_outlined) : const Icon(Icons.circle_outlined),
              title: const Text("English"),
              dense: true, // Set to true for tighter spacing
              onTap: () {
                Provider.of<LocaleProvider>(context, listen: false)
                .updateLocale(const Locale('en'));
              },
            ), 

            ListTile(
              leading: currentLocale==const Locale('es') ? const Icon(Icons.check_circle_outlined) : const Icon(Icons.circle_outlined),
              title: const Text("Español"),
              dense: true, // Set to true for tighter spacing
              onTap: () {
                Provider.of<LocaleProvider>(context, listen: false)
                .updateLocale(const Locale('es'));
              },
            ), 

            ListTile(
              leading: currentLocale==const Locale('pt') ? const Icon(Icons.check_circle_outlined) : const Icon(Icons.circle_outlined),
              title: const Text("Português"),
              dense: true, // Set to true for tighter spacing
              onTap: () {
                Provider.of<LocaleProvider>(context, listen: false)
                .updateLocale(const Locale('pt'));
              },
            ),  

            const Divider(thickness: 1.0),
            ListTile(
              title: Text(localizations.menuExit),
              dense: true, // Set to true for tighter spacing
              leading: const Icon(Icons.logout), // Add leading icon
              onTap: () {
                SystemNavigator.pop();
              },
            ),            

    ];   

    return Drawer(
      child: ListView(
        children: _drawerItems,
      ),
    );
  }
}
