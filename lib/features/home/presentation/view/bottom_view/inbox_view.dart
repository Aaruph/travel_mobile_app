import 'package:flutter/material.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat Room",
          style: TextStyle(
            color: Colors.white, // ✅ White color
            fontWeight: FontWeight.bold, // ✅ Bold text
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              // Add new chat functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: "Search",
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Chat List
          Expanded(
            child: ListView(
              children: [
                _chatItem(
                  name: "Jessie Cooper",
                  message: "See you next week!",
                  time: "09:32 AM",
                  image: "assets/images/user1.jpg",
                  isHighlighted: true,
                ),
                _chatItem(
                  name: "Shawn Jones",
                  message: "That's Great, Thank you!",
                  time: "06:20 AM",
                  image: "assets/images/user2.jpg",
                ),
                _chatItem(
                  name: "Manang Trip",
                  message: "📷 Image",
                  time: "09:32 PM",
                  image: "assets/images/group_chat.jpg",
                ),
                _chatItem(
                  name: "Alexandria Lexi",
                  message: "🎙 Voice Message 3:02",
                  time: "08:45 AM",
                  image: "assets/images/user3.jpg",
                ),
                _chatItem(
                  name: "Mary James",
                  message: "Waiting for you",
                  time: "09:32 AM",
                  image: "assets/images/user4.jpg",
                ),
                _chatItem(
                  name: "Tom Parker",
                  message: "It's at 3:30 sharp",
                  time: "09:32 AM",
                  image: "assets/images/user5.jpg",
                ),
                _chatItem(
                  name: "Ali Ahmed",
                  message: "🎉 Gif",
                  time: "09:32 AM",
                  image: "assets/images/user6.jpg",
                ),
                _chatItem(
                  name: "Mariam Ali",
                  message: "🎉 Gif",
                  time: "09:32 AM",
                  image: "assets/images/user7.jpg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatItem({
    required String name,
    required String message,
    required String time,
    required String image,
    bool isHighlighted = false,
  }) {
    return Container(
      color: isHighlighted ? Colors.blue[50] : Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          // Profile Image
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(width: 12),
          // Chat Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Timestamp
          Text(
            time,
            style: TextStyle(color: Colors.grey[500], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
