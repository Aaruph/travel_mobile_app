import 'package:flutter/material.dart';

import '../productdetail/productdetail_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Location",
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.teal, size: 16),
                Text("Kathmandu, Nepal",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            SizedBox(height: 16),
            _buildCategoryFilters(),
            SizedBox(height: 16),
            _buildSectionHeader("Top Trips"),
            _buildTopTrips(context),
            SizedBox(height: 16),
            _buildSectionHeader("Group Trips"),
            _buildGroupTrips(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.filter_list, color: Colors.teal),
        ],
      ),
    );
  }

  Widget _buildCategoryFilters() {
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.waves, "label": "Lakes"},
      {"icon": Icons.terrain, "label": "Mountain"},
      {"icon": Icons.forest, "label": "Forest"},
      {"icon": Icons.beach_access, "label": "Sea"},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories
          .map((category) => Chip(
                avatar: Icon(category["icon"], color: Colors.teal),
                label: Text(category["label"]),
                backgroundColor: Colors.teal[50],
              ))
          .toList(),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(
            onPressed: () {},
            child: Text("See All", style: TextStyle(color: Colors.teal)))
      ],
    );
  }

  Widget _buildTopTrips(BuildContext context) {
    List<Map<String, dynamic>> trips = [
      {
        "image": "assets/images/rara_lake.jpg",
        "title": "Rara Lake",
        "location": "Nepal",
        "rating": 4.5,
        "price": "\$40 /Visit",
        "description":
            "Rara Lake is one of the most beautiful lakes in Nepal, known for its stunning scenery and pristine environment."
      },
      {
        "image": "assets/images/tilicho_lake.jpg",
        "title": "Tilicho Lake",
        "location": "Manang",
        "rating": 4.5,
        "price": "\$40 /Visit",
        "description":
            "Tilicho Lake, located at 4,949m, is the highest altitude lake in the world, surrounded by breathtaking mountains."
      },
      {
        "image": "assets/images/shey_phoksundo_lake.jpg",
        "title": "Shey-Phoksundo",
        "location": "Nepal",
        "rating": 4.5,
        "price": "\$40 /Visit",
        "description":
            "Shey-Phoksundo Lake is a deep blue lake in Nepal, famous for its unique turquoise color and scenic surroundings."
      },
    ];

    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trips.length,
        itemBuilder: (context, index) {
          var trip = trips[index];
          return GestureDetector(
            onTap: () {
              // Navigate to ProductDetailView
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailView(
                    image: trip["image"],
                    title: trip["title"],
                    location: trip["location"],
                    rating: trip["rating"],
                    description: trip["description"],
                    price: trip["price"],
                  ),
                ),
              );
            },
            child: Container(
              width: 170,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 4,
                      spreadRadius: 2)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(trip["image"],
                        height: 120, width: double.infinity, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(trip["title"],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Text(trip["rating"].toString(),
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        Text(trip["price"],
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGroupTrips() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset("assets/images/mountain_trip.jpg",
                height: 120, fit: BoxFit.cover),
          ),
          SizedBox(height: 8),
          Text("Mountain Trip",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("Mount Everest Base Camp"),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.teal),
              Text(" Nepal"),
              Spacer(),
              Text("80%"),
            ],
          ),
          SizedBox(height: 4),
          LinearProgressIndicator(value: 0.8, color: Colors.teal),
        ],
      ),
    );
  }
}
