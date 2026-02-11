
import 'package:fin_pay/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://placeimg.com/100/100/people'),
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amir Rashid',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('rashidamr532@gmail.com',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.green.shade200),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Account Info',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildInfoCard(Icons.location_on, 'My Address'),
              const SizedBox(height: 10),
              _buildInfoCard(Icons.credit_card, 'My Card'),
              const SizedBox(height: 10),
              _buildInfoCard(Icons.history, 'Transaction History'),
              const SizedBox(height: 10),
              _buildInfoCard(Icons.security, 'Security'),
              const SizedBox(height: 30),
              const Text(
                'Help & Support',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildInfoCard(Icons.help_center, 'Help Center'),
              const SizedBox(height: 10),
              _buildInfoCard(Icons.people, 'Invite Friends'),
              const SizedBox(height: 10),
              _buildInfoCard(Icons.privacy_tip, 'Privacy Policy'),
              const SizedBox(height: 30),
              Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 1,
                child: ListTile(
                  title: const Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.withOpacity(0.1),
          child: Icon(icon, color: Colors.green),
        ),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
