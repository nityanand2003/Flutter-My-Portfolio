import 'package:flutter/material.dart';
import 'app_scaffold.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  // project data
  static const List<Map<String, String>> projectsData = [
    {
      'title': 'Portfolio App',
      'tech': 'Flutter, Dart',
      'description':
      'Developed a personal portfolio mobile application using Flutter and Dart to showcase my education, skills, and projects. Implemented smooth navigation, modern UI design, and integrated a download resume feature.',
      'icon': 'assets/images/portfolio.png', // Placeholder for a custom icon
    },
    {
      'title': 'Weather Forecast App',
      'tech': 'Flutter, Dart, Open Weather Map API',
      'description':
      'Built a weather forecast app that provides real-time temperature, humidity, and wind speed for any city using Open Weather Map API. Designed a clean, user-friendly interface with dynamic weather icons and animations.',
      'icon': 'assets/images/weather.png',
    },
    {
      'title': 'To-Do List App',
      'tech': 'Flutter, Dart, Hive (Local Database)',
      'description':
      'Created a task management app allowing users to add, update, and delete daily tasks with data stored locally using Hive. Focused on intuitive design and efficient state management for smooth performance.',
      'icon': 'assets/images/todo.png',
    },
    {
      'title': 'Expense Tracker App',
      'tech': 'Flutter, Dart, charts_flutter',
      'description':
      'Developed an expense tracker app to record daily transactions, categorize spending, and visualize monthly expenses through interactive charts. Implemented local data storage and filtering for better expense insights.',
      'icon': 'assets/images/expense.png',
    },
  ];

  // single project card
  // --- Here the BuildContext context is added ---
  Widget _buildProjectCard(Map<String, String> data, BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['title']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Tech Stack: ${data['tech']!}',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
            ),
            const Divider(height: 15),
            Text(
              data['description']!,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {
                  // Insert logic to open GitHub/Demo Link here
                  // context is now available
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${data['title']!} Link to be opened...')),
                  );
                },
                icon: const Icon(Icons.link, size: 18),
                label: const Text('View Project'),
                style: TextButton.styleFrom(foregroundColor: Colors.lightBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Projects',
      selectedIndex: 3, // Index of Projects
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'My Flutter Development Projects',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightBlue),
            ),
            const Divider(height: 25, thickness: 2, color: Colors.lightBlueAccent),
            // --- Here context is passed ---
            ...projectsData.map((data) => _buildProjectCard(data, context)).toList(),
          ],
        ),
      ),
    );
  }
}