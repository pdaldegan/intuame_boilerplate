import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final Function onItemSelected; // Callback to notify selection change

  const MyDrawer({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _drawerItems = [
            ListTile(
              title: Text('News'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/news');
              },
            ),
            ListTile(
              title: Text('Input'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/input');
              },
            ),
            ListTile(
              title: Text('Results'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/results');
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/about');
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