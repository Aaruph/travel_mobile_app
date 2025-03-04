import 'package:flutter/material.dart';
import 'package:travel_mobile_app/features/home/presentation/view/booking/booking_view.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Saved Trips",
          style: TextStyle(
            color: Colors.white, // ✅ White color
            fontWeight: FontWeight.bold, // ✅ Bold text
          ),
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
            const Text(
              "Events",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _wishlistCard(
              context,
              "Rara Lake",
              "Nepal",
              "assets/images/rara_lake.jpg",
              4.5,
              "\$40 / Visit",
            ),
            _wishlistCard(
              context,
              "Tilicho Lake",
              "Nepal",
              "assets/images/tilicho_lake.jpg",
              4.5,
              "\$60 / Visit",
            ),

            const SizedBox(height: 16),

            // Packages Section
            const Text(
              "Packages",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _wishlistCard(
              context,
              "Hotel Manang",
              "Manang",
              "assets/images/mount_everest.jpg",
              4.5,
              "\$120 / 3 day visit",
            ),
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
    String price,
  ) {
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                              RegExp(r'[^0-9.]'), '')), // Extract numeric price
                        ),
                      ),
                    );
                  },
                  child: const Text("Book Now",
                      style: TextStyle(fontSize: 12, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
