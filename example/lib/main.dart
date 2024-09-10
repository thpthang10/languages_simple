import 'package:flutter/material.dart';
import 'package:languages_simple/languages_simple.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LanguagesSimple',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true),
        home: const MyHomePage(title: 'LanguagesSimple'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title)),
      //
      // --------------------------------
      // Simple case
      // --------------------------------
      // body: LanguagesSimple(
      //   onPressedLanguage: (List<String> val) {
      //     debugPrint('$val');
      //   },
      //   decoration: const BoxDecoration(color: Colors.white),
      //   selectedDecoration: const BoxDecoration(color: Colors.green),
      // ),
      //
      // --------------------------------
      // Sort by language codes
      // --------------------------------
      // body: LanguagesSimple(
      //   onPressedLanguage: (List<String> val) {
      //     debugPrint('$val');
      //   },
      //   decoration: const BoxDecoration(color: Colors.white),
      //   selectedDecoration: const BoxDecoration(color: Colors.green),
      //   isSortedByLanguageCode: true,
      // ),
      //
      // --------------------------------
      // Pass your own language codes
      // --------------------------------
      // body: LanguagesSimple(
      //   onPressedLanguage: (List<String> val) {
      //     debugPrint('$val');
      //   },
      //   decoration: const BoxDecoration(color: Colors.white),
      //   selectedDecoration: const BoxDecoration(color: Colors.green),
      //   // your favorite language codes
      //   languageCodes: const [
      //     'ar',
      //     'ca',
      //     'cn',
      //     'en',
      //     'fr',
      //     'hi',
      //     'ja',
      //     'ko',
      //     'pt',
      //     'ru',
      //     'vi',
      //   ],
      // ),
      //
      // ------------------------------------
      // Pass your own initial language code
      // ------------------------------------
      body: LanguagesSimple(
        onPressedLanguage: (List<String> val) {
          debugPrint('$val');
        },
        decoration: const BoxDecoration(color: Colors.white),
        selectedDecoration: const BoxDecoration(color: Colors.green),
        // your favorite language codes
        languageCodes: const [
          'ar',
          'ca',
          'cn',
          'en',
          'fr',
          'hi',
          'ja',
          'ko',
          'pt',
          'ru',
          'vi',
        ],
        initialLanguageCode: 'fr',
      ),
    );
  }
}
