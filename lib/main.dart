import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/about_us_page.dart';
import 'pages/find_us_page.dart';
import 'pages/contact_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(const GreenAndSereneWebsite());
}

class GreenAndSereneWebsite extends StatelessWidget {
  const GreenAndSereneWebsite({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 58, 222, 12),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green[900],
            textStyle: const TextStyle(fontSize: 15),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,

      //initial route of the app, which is the home page
      initialRoute: '/home',

      // routes for the app
      routes: {
        '/home': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/location': (context) => const LocationPage(),
        '/menu': (context) => const MenuPage(),
      },
    );
  }
}
