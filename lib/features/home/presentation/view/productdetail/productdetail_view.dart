import 'package:flutter/material.dart';

import '../booking/booking_view.dart';

class ProductDetailView extends StatefulWidget {
  final String image;
  final String title;
  final String location;
  final double rating;
  final String description;
  final String price;

  const ProductDetailView({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.rating,
    required this.description,
    required this.price,
  });

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  bool isFavorite = false; // Toggle state for Favorite button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.image,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20)),
                  child: Image.asset(widget.image,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.teal),
                      const SizedBox(width: 4),
                      Text(widget.location,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600])),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      Text(widget.rating.toString(),
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text("Description",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 120,
                    child: SingleChildScrollView(
                      child: Text(widget.description,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700])),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Price",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(widget.price,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // Expanded Book Now Button
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingView(
                        title: widget.title,
                        location: widget.location,
                        rating: widget.rating,
                        price: double.parse(
                            widget.price.replaceAll(RegExp(r'[^0-9.]'), '')),
                      ),
                    ),
                  );
                },
                child: const Text("Book Now",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            const SizedBox(width: 12), // Spacing between buttons

            // Favorite Button (Toggle between filled and outlined heart)
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite; // Toggle favorite state
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
