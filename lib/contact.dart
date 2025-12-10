import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // URL लॉन्च करने के लिए ज़रूरी
import 'app_scaffold.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  // Resume से संपर्क जानकारी
  static const Map<String, String> contactInfo = {
    'phone': '+91 7856876825',
    'email': '03nkumar01@gmail.com',
    'linkedin': 'linkedin.com/in/nkumar03',
    'github': 'github.com/nityanand2003',
    'leetcode': 'leetcode.com/nityanand2003',
    'location': 'Nawada, Bihar - 805110',
  };

  // URL लॉन्च करने के लिए async फ़ंक्शन
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  // एकल संपर्क कार्ड
  Widget _buildContactTile(IconData icon, String title, String subtitle, String type) {
    String url = '';
    if (type == 'phone') {
      url = 'tel:${contactInfo['phone']}';
    } else if (type == 'email') {
      url = 'mailto:${contactInfo['email']}';
    } else if (type == 'linkedin') {
      url = 'https://${contactInfo['linkedin']}';
    } else if (type == 'github') {
      url = 'https://${contactInfo['github']}';
    } else if (type == 'leetcode') {
      url = 'https://${contactInfo['leetcode']}';
    }
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.lightBlue, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: (type != 'location') ? const Icon(Icons.arrow_forward_ios, size: 16) : null,
        onTap: (type != 'location') ? () => _launchUrl(url) : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Contact Me',
      selectedIndex: 5, // Contact का इंडेक्स
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Get In Touch',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightBlue),
            ),
            const Divider(height: 25, thickness: 2, color: Colors.lightBlueAccent),

            _buildContactTile(
              Icons.phone,
              'Mobile Number',
              contactInfo['phone']!,
              'phone',
            ),
            _buildContactTile(
              Icons.email,
              'Email Address',
              contactInfo['email']!,
              'email',
            ),
            _buildContactTile(
              Icons.link,
              'LinkedIn Profile',
              contactInfo['linkedin']!,
              'linkedin',
            ),
            _buildContactTile(
              Icons.code,
              'GitHub Profile',
              contactInfo['github']!,
              'github',
            ),
            _buildContactTile(
              Icons.code,
              'LeetCode Profile',
              contactInfo['leetcode']!,
              'leetcode',
            ),
            _buildContactTile(
              Icons.location_on,
              'Location',
              contactInfo['location']!,
              'location',
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'I am actively looking for new opportunities in Software Development.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}