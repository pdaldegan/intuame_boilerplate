// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import '../widgets/mydrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../widgets/locale_provider.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:url_launcher/url_launcher.dart';

bool hasNews=false;

class newsPage extends StatelessWidget {
  final AppLocalizations localizations;

  const newsPage({Key? key, required this.localizations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Provider.of<LocaleProvider>(context).appLocale;
    String languageCode = currentLocale.languageCode;
    DateTime now = DateTime.now();
    String dataAtual = DateFormat('yyyy-MM-dd').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.screenheaderNews),
      ),
      drawer: MyDrawer(key: null, localizations: localizations, onItemSelected: () {}),
      body: FutureBuilder<QuerySnapshot?>(
          future: _getBlogData(languageCode,dataAtual),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            //Connection error
            if (!snapshot.hasData || snapshot.hasError) {
              return Center(
                child: Text(localizations.unabletoaccess),
              );
            } 

            final documents = snapshot.data!.docs.toList()..sort(
                (a, b) => b['datainicio'].compareTo(a['datainicio'])); // Descending order
            documents.removeWhere((doc) => (doc.data() as Map<String, dynamic>?)?.containsKey('${languageCode}_conteudo') != true);
            documents.removeWhere((doc) {
                Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
                String? datainicio = data?['datainicio'] as String?;
                print("Inicio:$datainicio  /  Atual:$dataAtual  /  ");
                return datainicio != null && datainicio.compareTo(dataAtual) > 0;
            });
            // Removed limit to news
            //documents.length = documents.length > 5 ? 5 : documents.length; // Limit to 5 items

            if (documents.isEmpty) { //Replaced snapshot.data!.docs.isEmpty with documents.isEmpty
              return Center(
                child: Text(localizations.nonews),
              );
            } else {
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    //Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                    final content = document['${languageCode}_conteudo'];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Html(
                                data: content ?? '',
                                //onLinkTap: (url, _, __, ___) {
                                  // Handle link tap here
                                  //print('Link tapped: $url');
                                  // Need to be tested
                                  //launchUrl(Uri.parse(url!));// Handle potential null value
                                //},
                        ),
                      )
                    );
                  }
                );
            }
           
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/input');
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  Future<QuerySnapshot?> _getBlogData(languageCode,dataAtual) async {
    final stopwatch = Stopwatch()..start();

    try {
      final snapshot = await FirebaseFirestore.instance
        .collection('Blog3')
        //.where('${languageCode}_conteudo', isEqualTo: true)
        .where('datafim', isGreaterThanOrEqualTo: dataAtual) 
        //.orderBy('datafim', descending: true)
        //.limit(5)
        .get();

      if (stopwatch.elapsedMilliseconds > 5000) {
        throw TimeoutException('Document fetch timed out');
      }
      return snapshot;

    } catch (e) {
      print('Error fetching documents: $e'); // Log the error for debugging
      return null; // Re-throw the exception for handling in FutureBuilder
    }
  }
}