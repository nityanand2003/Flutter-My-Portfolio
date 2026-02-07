import 'package:flutter/material.dart';
import 'home.dart';
import 'education.dart';
import 'skills.dart';
import 'projects.dart';
import 'experience.dart';
import 'contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio App',
      theme: ThemeData(
        // Default AppBar color for all pages is 'sky blue'
        appBarTheme: const AppBarTheme(
          color: Colors.lightBlue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        // Normal text color
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color.fromARGB(255, 34, 34, 34)),
        ),
        // Main color scheme
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/education': (context) => const EducationPage(),
        '/skills': (context) => const SkillsPage(),
        '/projects': (context) => const ProjectsPage(),
        '/experience': (context) => const ExperiencePage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}