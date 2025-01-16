import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
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
              Icon(Icons.location_on, color: Colors.teal),
              SizedBox(width: 8),
              Text('Kathmandu, Nepal', style: TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              suffixIcon: IconButton(
                icon: const Icon(Icons.filter_list, color: Colors.grey),
                onPressed: () {},
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ['Lakes', 'Mountain', 'Forest']
                  .map(
                    (category) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Chip(
                        label: Text(category,
                            style: const TextStyle(color: Colors.teal)),
                        backgroundColor: Colors.teal[50],
                        side: const BorderSide(color: Colors.teal),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          const SectionHeader(title: 'Top Trips'),
          const SizedBox(height: 8),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                TripCard(
                  title: 'Rara Lake',
                  price: '\$40/Visit',
                  image: 'assets/images/rara_lake.jpg',
                ),
                TripCard(
                  title: 'Tilicho Lake',
                  price: '\$40/Visit',
                  image: 'assets/images/tilicho_lake.jpg',
                ),
                TripCard(
                  title: 'Phoksundo Lake',
                  price: '\$40/Visit',
                  image: 'assets/images/shey_phoksundo_lake.jpg',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const SectionHeader(title: 'Group Trips'),
          const SizedBox(height: 8),
          const GroupTripCard(
            title: 'Mountain Trip',
            location: 'Mount Everest Base Camp',
            progress: 0.8,
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatefulWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  State<SectionHeader> createState() => _SectionHeaderState();
}

class _SectionHeaderState extends State<SectionHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('See All', style: TextStyle(color: Colors.teal)),
        ),
      ],
    );
  }
}

class TripCard extends StatefulWidget {
  final String title;
  final String price;
  final String image;

  const TripCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  State<TripCard> createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 8),
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(widget.image, fit: BoxFit.cover),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.price,
                      style: const TextStyle(color: Colors.teal)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroupTripCard extends StatefulWidget {
  final String title;
  final String location;
  final double progress;

  const GroupTripCard({
    super.key,
    required this.title,
    required this.location,
    required this.progress,
  });

  @override
  State<GroupTripCard> createState() => _GroupTripCardState();
}

class _GroupTripCardState extends State<GroupTripCard> {
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
                    widget.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(widget.location),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: widget.progress,
                    backgroundColor: Colors.teal[100],
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Image.asset('assets/images/mountain_trip.jpg',
                  fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
