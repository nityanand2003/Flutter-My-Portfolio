import 'package:flutter/material.dart';
import 'app_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Navigation Grid Data
  static const List<Map<String, dynamic>> _gridItems = [
    {'name': 'Education', 'route': '/education', 'icon': Icons.school, 'color': Colors.orange},
    {'name': 'Skills', 'route': '/skills', 'icon': Icons.flash_on, 'color': Colors.green},
    {'name': 'Projects', 'route': '/projects', 'icon': Icons.work, 'color': Colors.red},
    {'name': 'Experience', 'route': '/experience', 'icon': Icons.business, 'color': Colors.purple},
    {'name': 'Contact', 'route': '/contact', 'icon': Icons.contact_mail, 'color': Colors.teal},
    {'name': 'More Info', 'route': '/home', 'icon': Icons.info, 'color': Colors.blueGrey}, // Home पर ही रखता हूँ
  ];

  // Function to create Grid Card
  Widget _buildGridCard(BuildContext context, Map<String, dynamic> item) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          if (item['route'] != '/home') {
            Navigator.pushReplacementNamed(context, item['route']);
          }
        },
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(item['icon'], size: 40, color: item['color']),
            const SizedBox(height: 10),
            Text(
              item['name']!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: item['color']),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Home (Portfolio)',
      selectedIndex: 0, // Index of Home
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Custom Banner Area (Logo, Name, Designation)
            Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
                image: DecorationImage(
                  image: AssetImage('assets/bg01.jpg'), // Banner Photo
                  fit: BoxFit.cover,
                  opacity: 0.6,
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/001.jpg'), // DP/Logo
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Nityanand Kumar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 5, color: Colors.black54)],
                      ),
                    ),
                    Text(
                      'Aspiring Software Engineer',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        shadows: [Shadow(blurRadius: 5, color: Colors.black54)],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to My Portfolio',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.lightBlue),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Here you can learn about my educational qualifications, skills, projects, and internship experience. I aim to contribute to a challenging software development career.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 20),

                  // 6-Section Grid
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(), // Required for scrollable body
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 Column
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.2, // Aspect Ratio of Card
                    ),
                    itemCount: _gridItems.length,
                    itemBuilder: (context, index) {
                      return _buildGridCard(context, _gridItems[index]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}