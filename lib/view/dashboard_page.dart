// view/dashboard_page.dart
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Location',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 8),
                  Text('Kathmandu, Nepal'),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Top Trips',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    TripCard(title: 'Rara Lake', price: '\$40/Visit'),
                    TripCard(title: 'Tilicho Lake', price: '\$40/Visit'),
                    TripCard(title: 'Shey-Phoksundo Lake', price: '\$40/Visit'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Group Trips',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const GroupTripCard(
                title: 'Mountain Trip',
                location: 'Mount Everest Base Camp',
                progress: 0.8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final String title;
  final String price;

  const TripCard({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 8),
      child: SizedBox(
        width: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset('assets/images/rara_lake.jpg', fit: BoxFit.cover),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(price),
            ],
          ),
        ),
      ),
    );
  }
}

class GroupTripCard extends StatelessWidget {
  final String title;
  final String location;
  final double progress;

  // ignore: use_key_in_widget_constructors
  const GroupTripCard({required this.title, required this.location, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(location),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: progress),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Image.asset('assets/images/mount_everest.jpg', fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}