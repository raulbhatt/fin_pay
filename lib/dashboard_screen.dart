
import 'package:fin_pay/profile_screen.dart';
import 'package:fin_pay/qr_scanner_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _openCamera() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRScannerScreen()),
    );
    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Scanned QR code: $result')),
      );
    }
  }

  // Define the pages for each tab
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    Center(child: Text('Statics Page')),
    Center(child: Text('My Cards Page')),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      floatingActionButton: FloatingActionButton(
        onPressed: _openCamera,
        shape: const CircleBorder(),
        child: const Icon(Icons.qr_code_scanner, color: Colors.white,),
        backgroundColor: Colors.green[700],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.bar_chart, 'Statistics', 1),
            const SizedBox(width: 48), // The space for the FAB
            _buildNavItem(Icons.credit_card_sharp, 'My Cards', 2),
            _buildNavItem(Icons.person, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        _onItemTapped(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: _selectedIndex == index ? Colors.green : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: _selectedIndex == index ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
