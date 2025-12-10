import 'package:flutter/material.dart';
import 'app_scaffold.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  // Resume से कौशल डेटा
  static const List<String> technicalSkills = [
    'Flutter/Dart (Core)',
    'HTML, CSS, JavaScript',
    'C, C++, Java, Python',
    'MySQL',
  ];
  static const List<String> tools = [
    'VS Code',
    'Android Studio',
    'Git',
    'GitHub',
    'MS Word, MS Excel',
    'Canva',
  ];
  static const List<String> softSkills = [
    'Communication',
    'Collaboration',
    'Teamwork',
    'Leadership',
    'English Typing (40 wpm)',
  ];

  // कौशल सेक्शन कार्ड
  Widget _buildSkillSection(String title, List<String> skills, IconData icon, Color color) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 28),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1, height: 20),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: skills.map((skill) => Chip(
                label: Text(skill),
                backgroundColor: color.withOpacity(0.1),
                side: BorderSide(color: color.withOpacity(0.5)),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Skills',
      selectedIndex: 2, // Skills का इंडेक्स
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'My Core Competencies',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightBlue),
            ),
            const Divider(height: 25, thickness: 2, color: Colors.lightBlueAccent),

            _buildSkillSection(
              'Technical Skills',
              technicalSkills,
              Icons.code,
              Colors.blueAccent,
            ),

            _buildSkillSection(
              'Tools & Platforms',
              tools,
              Icons.build,
              Colors.orange,
            ),

            _buildSkillSection(
              'Soft Skills',
              softSkills,
              Icons.people,
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}