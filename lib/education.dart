import 'package:flutter/material.dart';
import 'app_scaffold.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  // education data
  static const List<Map<String, String>> educationData = [
    {
      'course': 'B. Tech (CSE)',
      'institution': 'SEC Sasaram, Rohtas (Bihar) | BEU Patna',
      'year': 'Oct\'22 - Jun\'26',
      'result': 'CGPA: 7.02',
    },
    {
      'course': '12th (Intermediate)',
      'institution': 'Inter School Nardiganj Nawada, Nawada (Bihar) | BSEB Patna',
      'year': 'Mar\'20',
      'result': 'Marks: 71.8%',
    },
    {
      'course': '10th (Matriculation)',
      'institution': 'Inter School Nardiganj Nawada, Nawada (Bihar) | BSEB Patna',
      'year': 'Jun\'18',
      'result': 'Marks: 63.4%',
    },
  ];

  // single education card
  Widget _buildEducationCard(Map<String, String> data) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['course']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              data['institution']!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Year: ${data['year']!}',
                  style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.black54),
                ),
                Text(
                  data['result']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Education',
      selectedIndex: 1, // Index of Education
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'My Academic Journey',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightBlue),
            ),
            const Divider(height: 25, thickness: 2, color: Colors.lightBlueAccent),
            ...educationData.map((data) => _buildEducationCard(data)).toList(),
            const SizedBox(height: 20),
            const Text(
              'Positions of Responsibility',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            _buildResponsibility('Training & Placement Cell Student Coordinator', Icons.people_outline),
            _buildResponsibility('Class Representative', Icons.group),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsibility(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.lightBlue, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}