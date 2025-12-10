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
        // सभी पेजों के लिए डिफ़ॉल्ट AppBar रंग 'sky blue'
        appBarTheme: const AppBarTheme(
          color: Colors.lightBlue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        // सामान्य टेक्स्ट रंग
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color.fromARGB(255, 34, 34, 34)),
        ),
        // मुख्य रंग योजना
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