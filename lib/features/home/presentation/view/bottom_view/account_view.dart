import 'package:flutter/material.dart';
import 'package:travel_mobile_app/features/home/presentation/view/editprofile/editprofile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white, // ✅ White color
            fontWeight: FontWeight.bold, // ✅ Bold text
          ), // ✅ White text
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit,
                color: Colors.white), // ✅ Edit profile icon
            onPressed: () {
              // Navigate to Edit Profile Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditProfileView()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    'https://example.com/profile-image.jpg', // Replace with actual image URL
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'ishowspeed',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ishowspeed@gmail.com',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),

          // Profile Options List
          Expanded(
            child: ListView(
              children: [
                _buildProfileOption(Icons.person, 'Personal Information'),
                _buildProfileOption(Icons.feedback, 'Feedback'),
                _buildProfileOption(Icons.favorite, 'My Favourites'),
                _buildProfileOptionWithBadge(
                    Icons.notifications, 'Notifications', 2),
                _buildProfileOption(Icons.chat, 'Message Center'),
                _buildProfileOption(Icons.location_on, 'Address'),
                _buildProfileOption(Icons.settings, 'Settings'),
              ],
            ),
          ),

          // Logout Button
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 150.0, vertical: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // ✅ Logout button color
                minimumSize:
                    const Size(double.infinity, 50), // Full-width button
              ),
              onPressed: () {
                _showLogoutDialog(context);
              },
              child:
                  const Text('Logout', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Add navigation or actions
      },
    );
  }

  Widget _buildProfileOptionWithBadge(
      IconData icon, String title, int badgeCount) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (badgeCount > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badgeCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
      onTap: () {
        // Add navigation or actions
      },
    );
  }

  // Logout Confirmation Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                // TODO: Implement logout logic (e.g., clear session, navigate to login screen)
              },
              child: const Text("Logout", style: TextStyle(color: Colors.teal)),
            ),
          ],
        );
      },
    );
  }
}
