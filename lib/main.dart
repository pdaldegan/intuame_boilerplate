import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import './widgets/locale_provider.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:intl/intl.dart';
//import 'package:flutter/services.dart';
import './pages/terms.dart';
import './pages/news.dart';
import './pages/input.dart';
import './pages/results.dart';
import './pages/about.dart';


void main() async {

    WidgetsFlutterBinding.ensureInitialized();
    // Initialize Firebase
    await Firebase.initializeApp();
    // Initialize SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    // Get cached locale from SharedPreferences
    String? cachedLocale = prefs.getString('app_locale');
    // Get system's preferred locale
    String systemLocale = WidgetsBinding.instance.window.locale.languageCode;
    // Define the supported locales in the order of preference
    List<String> supportedLocales = ['en', 'es', 'pt'];
    // Decide the app's locale
    Locale initialLocale;
    if (cachedLocale != null) {
      // Use cached locale if available
      initialLocale = Locale(cachedLocale);
    } else if (supportedLocales.contains(systemLocale)) {
      // Use system locale if it matches one of the supported locales
      initialLocale = Locale(systemLocale);
    } else {
      // Default to English if system locale is not supported
      initialLocale = const Locale('en');
    }
    // Cache the decided locale for future use
    prefs.setString('app_locale', initialLocale.languageCode);

  runApp(
    ChangeNotifierProvider<LocaleProvider>(
      create: (_) => LocaleProvider(prefs, initialLocale),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  
  //final Locale appLocale;
  
  const MyApp({super.key});

  //final Locale appLocale;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, _) {    
    
      return MaterialApp(
        title: 'Intuame Calculator Boilerplate',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Set app locale
        //locale: appLocale,
        // Define the supported locales
        locale: localeProvider.appLocale,
        supportedLocales: const [
          Locale('en', ''), // English
          Locale('pt', ''), // Portuguese
          Locale('es', ''), // Spanish
        ],
        //Widgets localization support
        // https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        //final AppLocalizations localizations = AppLocalizations.of(context)!;
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/news' : (context) => newsPage(localizations: AppLocalizations.of(context)!),
          '/input': (context) => inputPage(localizations: AppLocalizations.of(context)!),
          '/results': (context) => resultsPage(localizations: AppLocalizations.of(context)!),
          '/about': (context) => aboutPage(localizations: AppLocalizations.of(context)!),
        },
      );
    }
  );}
}

class HomePage extends StatelessWidget {

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final AppLocalizations localizations = AppLocalizations.of(context)!;
          return termsPage(localizations: localizations);
        },
      ),
    );
  }
}

