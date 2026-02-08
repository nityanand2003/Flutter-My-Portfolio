import 'package:flutter/material.dart';
import 'app_scaffold.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  // internship data
  static const Map<String, dynamic> internshipData = {
    'role': 'Engineering Intern',
    'company': 'East Central Railway (Hajipur)',
    'location': 'Patna Junction, Bihar, India',
    'duration': 'Jun\'25',
    'details': [
      'Signaling Systems: Track Circuit, Point Machine, Axle Counter, Absolute & Automatic Block working को समझा।',
      'Telecom Operations: OFC system, Quad cable communication system, Control communication system की वर्किंग को समझा।',
      'Networking & IT: Railway Networking system (Railnet/UTS/FOIS, etc) और IT applications जैसे e-Office, HRMS, आदि की कार्यप्रणाली का अध्ययन किया।',
      'Focus: IT और बड़े Enterprise Systems के कार्यान्वयन और वास्तुकला की समझ विकसित की, जो सॉफ्टवेयर डेवलपमेंट के लिए महत्वपूर्ण है।',
    ],
  };

  // achievements
  static const List<String> achievements = [
    'Secured 1st prize in Fine Arts at the district level, twice (2019 and 2020).',
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Experience & Achievements',
      selectedIndex: 4, // Index of Experience
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Professional Experience (Internship)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightBlue),
            ),
            const Divider(height: 25, thickness: 2, color: Colors.lightBlueAccent),

            // Internship Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(internshipData['role']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.lightBlue)),
                    const SizedBox(height: 4),
                    Text('${internshipData['company']!} | ${internshipData['duration']!}', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                    Text(internshipData['location']!, style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black54)),
                    const Divider(height: 20),
                    ...internshipData['details'].map<Widget>((detail) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Icon(Icons.arrow_right, color: Colors.lightBlue, size: 18),
                          ),
                          const SizedBox(width: 5),
                          Expanded(child: Text(detail, style: const TextStyle(fontSize: 15, height: 1.4))),
                        ],
                      ),
                    )).toList(),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              'Achievements & Hobbies',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightBlue),
            ),
            const Divider(height: 25, thickness: 2, color: Colors.lightBlueAccent),

            // Achievements
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.star, color: Colors.amber, size: 30),
                title: const Text('District Level Fine Arts Winner', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(achievements[0]),
              ),
            ),
            const SizedBox(height: 15),
            // Hobbies & Strengths
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Strengths & Hobbies', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: [
                        _buildHobbyChip('Hardworking & Result-Oriented', Icons.lightbulb_outline),
                        _buildHobbyChip('Honest and Punctual', Icons.access_time),
                        _buildHobbyChip('Sketching, Painting, Singing', Icons.palette),
                        _buildHobbyChip('Playing Chess and Volleyball', Icons.sports_volleyball),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHobbyChip(String label, IconData icon) {
    return Chip(
      avatar: Icon(icon, size: 18, color: Colors.white),
      label: Text(label, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.lightBlue.shade300,
    );
  }
}