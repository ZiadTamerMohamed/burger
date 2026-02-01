import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/ThemeProvider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Profile Image
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.orange.shade100,
              backgroundImage: const AssetImage(
                'assets/images/profile.png',
              ),
            ),

            const SizedBox(height: 15),

            // Name
            const Text(
              "Burger Lover 🍔",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            // Email
            const Text(
              "burger@burgershot.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // Options
            buildProfileTile(
              icon: Icons.shopping_bag,
              title: "My Orders",
              onTap: () {},
            ),

            buildProfileTile(
              icon: Icons.favorite,
              title: "Favorites",
              onTap: () {},
            ),

            buildProfileTile(
              icon: Icons.settings,
              title: "Settings",
              onTap: () {},
            ),

            buildProfileTile(
              icon: Icons.logout,
              title: "Logout",
              textColor: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileTile({
    required IconData icon,
    required String title,
    Color textColor = Colors.black,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        elevation: 3,
        child: ListTile(
          leading: Icon(icon, color: Colors.orange),
          title: Text(title, style: TextStyle(fontSize: 18, color: textColor)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
      ),
    );
  }
}
