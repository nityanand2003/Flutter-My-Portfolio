import 'package:flutter/material.dart';

// A common scaffold for all pages
// // It handles the AppBar, Drawer, and BottomNavigationBar.
class AppScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final int selectedIndex;

  const AppScaffold({
    super.key,
    required this.body,
    required this.title,
    required this.selectedIndex,
  });

  // List of navigation for all pages
  static const List<Map<String, dynamic>> _navItems = [
    {'name': 'Home', 'route': '/home', 'icon': Icons.home},
    {'name': 'Education', 'route': '/education', 'icon': Icons.school},
    {'name': 'Skills', 'route': '/skills', 'icon': Icons.flash_on},
    {'name': 'Projects', 'route': '/projects', 'icon': Icons.work},
    {'name': 'Experience', 'route': '/experience', 'icon': Icons.business},
    {'name': 'Contact', 'route': '/contact', 'icon': Icons.contact_mail},
  ];

  void _onItemTapped(BuildContext context, int index) {
    if (index != selectedIndex) {
      Navigator.pushReplacementNamed(context, _navItems[index]['route']);
    } else {
      // If clicked on the same page, do nothing or scroll to the top
    }
  }

  // Custom Drawer that meets your needs
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer Header - Background Image, Logo, Name, Designation
          UserAccountsDrawerHeader(
            accountName: const Text('Nityanand Kumar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            accountEmail: const Text('Aspiring Software Engineer', style: TextStyle(color: Colors.white70)),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/001.jpg'), // Logo/DP
              backgroundColor: Colors.white,
            ),
            decoration: const BoxDecoration(
              color: Colors.lightBlue,
              image: DecorationImage(
                image: AssetImage('assets/bg01.jpg'), // Banner Photo
                fit: BoxFit.cover,
                opacity: 0.7,
              ),
            ),
          ),
          // Navigation List Items
          ..._navItems.map((item) {
            final index = _navItems.indexOf(item);
            return ListTile(
              leading: Icon(item['icon'], color: index == selectedIndex ? Colors.lightBlue : Colors.grey[700]),
              title: Text(
                item['name']!,
                style: TextStyle(
                  fontWeight: index == selectedIndex ? FontWeight.bold : FontWeight.normal,
                  color: index == selectedIndex ? Colors.lightBlue : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // close drawer
                _onItemTapped(context, index);
              },
            );
          }).toList(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.grey),
            title: const Text('About App'),
            onTap: () {
              Navigator.pop(context);
              // Show the About App dialog
            },
          ),
        ],
      ),
    );
  }

  // Custom BottomNavigationBar
  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Fixed is required for 6 items
      backgroundColor: Colors.lightBlue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: selectedIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: _navItems.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item['icon']),
          label: item['name'],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 4,
      ),
      drawer: _buildDrawer(context),
      body: body,
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }
}