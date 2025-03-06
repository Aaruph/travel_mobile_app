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
            color: Colors.white,
            fontWeight: FontWeight.bold,
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
                  context,
                  name: "Puspa",
                  message: "See you next week!",
                  time: "09:32 AM",
                  image: "assets/images/puspa.jpg",
                  isHighlighted: true,
                ),
                _chatItem(
                  context,
                  name: "Tony stark",
                  message: "That's Great, Thank you!",
                  time: "06:20 AM",
                  image: "assets/images/tonystark.jpg",
                ),
                _chatItem(
                  context,
                  name: "lamine",
                  message: "📷 Image",
                  time: "09:32 PM",
                  image: "assets/images/lamine.jpg",
                ),
                _chatItem(
                  context,
                  name: "pedri",
                  message: "🎙 Voice Message 3:02",
                  time: "08:45 AM",
                  image: "assets/images/Pedri.jpg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatItem(
    BuildContext context, {
    required String name,
    required String message,
    required String time,
    required String image,
    bool isHighlighted = false,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailView(name: name, image: image),
          ),
        );
      },
      child: Container(
        color: isHighlighted ? Colors.blue[50] : Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(width: 12),
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
            Text(
              time,
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Chat Detail Screen
class ChatDetailView extends StatelessWidget {
  final String name;
  final String image;

  const ChatDetailView({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(height: 20),
            Text(
              "Chat with $name",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
