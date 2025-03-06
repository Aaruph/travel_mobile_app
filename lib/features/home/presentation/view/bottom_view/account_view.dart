import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_mobile_app/core/theme/theme_provider.dart';
import 'package:travel_mobile_app/core/theme/user_provider.dart';
import 'package:travel_mobile_app/features/auth/presentation/view/login_view.dart';
import 'package:travel_mobile_app/features/home/presentation/view/editprofile/editprofile_view.dart';
import 'package:travel_mobile_app/features/home/presentation/view/personalinfo/personalinfo_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileView(),
                ),
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
                  backgroundImage: AssetImage('assets/images/ishowspeed.jpg'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userProvider.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userProvider.email,
                      style: const TextStyle(color: Colors.grey),
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
                _buildProfileOption(
                  Icons.person,
                  'Personal Information',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PersonalInfoView(),
                      ),
                    );
                  },
                ),
                _buildProfileOption(
                  Icons.favorite,
                  'My Favourites',
                  () {
                    // Navigate to Favourites Screen (if implemented)
                  },
                ),
                _buildProfileOption(
                  Icons.settings,
                  'Settings',
                  () {
                    // Navigate to Settings Screen (if implemented)
                  },
                ),

                // Help Section
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Help',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildProfileOption(
                  Icons.info,
                  'About Us',
                  () {
                    // Navigate to About Us Screen (if implemented)
                  },
                ),
                _buildProfileOption(
                  Icons.contact_mail,
                  'Contact Us',
                  () {
                    // Navigate to Contact Us Screen (if implemented)
                  },
                ),

                // 🔥 Dark Mode Toggle Switch
                SwitchListTile(
                  title: const Text('Dark Mode'),
                  secondary: Icon(themeProvider.themeMode == ThemeMode.dark
                      ? Icons.dark_mode
                      : Icons.light_mode),
                  value: themeProvider.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                ),
              ],
            ),
          ),

          // Logout Button
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 150.0, vertical: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size(double.infinity, 50),
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

  Widget _buildProfileOption(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

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
                Navigator.pop(context); // Close the dialog without any action
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                // After confirming logout, navigate to the LoginView
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              child: const Text("Logout", style: TextStyle(color: Colors.teal)),
            ),
          ],
        );
      },
    );
  }
}
