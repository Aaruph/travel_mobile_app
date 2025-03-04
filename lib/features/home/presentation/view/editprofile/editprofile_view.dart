import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://example.com/profile-image.jpg', // Replace with actual image URL
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'ishowspeed',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Full Name
            _buildProfileField(Icons.person, 'Full Name', 'ishowspeed'),

            // Email Address
            _buildProfileField(
                Icons.email, 'Email Address', 'ishowspeed@gmail.com'),

            // Phone Number
            _buildProfileField(Icons.phone, 'Phone Number', '+9770001663389'),

            // Birth Date
            _buildBirthDateField(),

            const SizedBox(height: 10),
            const Text(
              'Joined 28 Jan 2021',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 10),
              Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildBirthDateField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Birth Date', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 5),
          Row(
            children: const [
              Text('28', style: TextStyle(fontSize: 16)),
              SizedBox(width: 15),
              Text('September', style: TextStyle(fontSize: 16)),
              SizedBox(width: 15),
              Text('2000', style: TextStyle(fontSize: 16)),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
