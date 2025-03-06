import 'package:flutter/material.dart';
import 'package:travel_mobile_app/features/home/presentation/view/booking/booking_view.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  final List<Map<String, dynamic>> _events = [
    {
      "title": "Rara Lake",
      "location": "Nepal",
      "image": "assets/images/rara_lake.jpg",
      "rating": 4.5,
      "price": "\$40 / Visit",
    },
    {
      "title": "Tilicho Lake",
      "location": "Nepal",
      "image": "assets/images/tilicho_lake.jpg",
      "rating": 4.5,
      "price": "\$40 / Visit",
    },
  ];

  final List<Map<String, dynamic>> _packages = [
    {
      "title": "Mountain Trip",
      "location": "Manang",
      "image": "assets/images/mount_everest.jpg",
      "rating": 4.5,
      "price": "\$120 / Three day visit",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Saved Trips",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Events Section
            if (_events.isNotEmpty) ...[
              const Text(
                "Events",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ..._events.map((event) {
                return _wishlistCard(
                  context,
                  event["title"],
                  event["location"],
                  event["image"],
                  event["rating"],
                  event["price"],
                  isPackage: false,
                );
              }),
              const SizedBox(height: 16),
            ],

            // Packages Section
            if (_packages.isNotEmpty) ...[
              const Text(
                "Packages",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ..._packages.map((package) {
                return _wishlistCard(
                  context,
                  package["title"],
                  package["location"],
                  package["image"],
                  package["rating"],
                  package["price"],
                  isPackage: true,
                );
              }),
            ],
          ],
        ),
      ),
    );
  }

  Widget _wishlistCard(
    BuildContext context,
    String title,
    String location,
    String image,
    double rating,
    String price, {
    required bool isPackage,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(location,
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Text(price,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(rating.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    // Book Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingView(
                              title: title,
                              location: location,
                              rating: rating,
                              price: double.parse(price.replaceAll(
                                  RegExp(r'[^0-9.]'),
                                  '')), // Extract numeric price
                            ),
                          ),
                        );
                      },
                      child: const Text("Book Now",
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    ),

                    // Show Delete Button for Both Events and Packages
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          if (isPackage) {
                            _packages.removeWhere((package) =>
                                package["title"] == title); // Remove package
                          } else {
                            _events.removeWhere((event) =>
                                event["title"] == title); // Remove event
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
