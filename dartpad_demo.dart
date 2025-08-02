import 'package:flutter/material.dart';

void main() {
  runApp(const SeniorComFinderApp());
}

class SeniorComFinderApp extends StatelessWidget {
  const SeniorComFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senior Community Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header (15% height)
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.shade800,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Senior Community Finder',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Main content with sidebars (70% height)
          Expanded(
            child: Row(
              children: [
                // Left sidebar (20% width)
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: Colors.grey.shade100,
                  child: const Center(
                    child: Text('Advertisement\nSpace'),
                  ),
                ),
                // Main content area (60% width)
                Expanded(
                  flex: 3,
                  child: const MainContentArea(),
                ),
                // Right sidebar (20% width)
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: Colors.grey.shade100,
                  child: const Center(
                    child: Text('Advertisement\nSpace'),
                  ),
                ),
              ],
            ),
          ),
          // Footer (15% height)
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            color: Colors.grey.shade800,
            child: const Center(
              child: Text(
                'Legal Disclaimers - © 2024 Senior Community Finder',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainContentArea extends StatefulWidget {
  const MainContentArea({super.key});

  @override
  State<MainContentArea> createState() => _MainContentAreaState();
}

class _MainContentAreaState extends State<MainContentArea>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showResults = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Specific Info'),
              Tab(text: 'Map'),
              Tab(text: 'Advisor'),
            ],
            labelColor: Colors.blue.shade800,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Specific Info Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Search Address Section
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Search Address',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const TextField(
                                decoration: InputDecoration(
                                  labelText: 'Zip Code *',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _showResults = true;
                                  });
                                },
                                child: const Text('Search'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Amenities Section
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Search Amenities',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Wrap(
                                children: [
                                  _buildAmenityChip('24/7 monitoring'),
                                  _buildAmenityChip('On-site staff'),
                                  _buildAmenityChip('Gym'),
                                  _buildAmenityChip('Pool'),
                                  _buildAmenityChip('Social events'),
                                  _buildAmenityChip('Independent living'),
                                  _buildAmenityChip('Assisted living'),
                                  _buildAmenityChip('Memory care'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (_showResults) ...[
                        const SizedBox(height: 16),
                        // Search Results
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Search Results',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                _buildResultCard(
                                  'Sunset Manor Senior Living',
                                  '123 Oak Street, Springfield, IL 62701',
                                  '(555) 123-4567',
                                  4.5,
                                ),
                                _buildResultCard(
                                  'Golden Years Community',
                                  '456 Maple Drive, Springfield, IL 62702',
                                  '(555) 987-6543',
                                  4.2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                // Map Tab
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map, size: 80, color: Colors.grey),
                      Text('Interactive Map Coming Soon'),
                    ],
                  ),
                ),
                // Advisor Tab
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.smart_toy, size: 80, color: Colors.blue),
                      Text('AI Assistant Chat Interface'),
                      SizedBox(height: 16),
                      Text('Ask me about senior communities...'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityChip(String label) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FilterChip(
        label: Text(label),
        onSelected: (bool selected) {},
      ),
    );
  }

  Widget _buildResultCard(String name, String address, String phone, double rating) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(address),
            Text(phone),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                Text(' $rating/5.0'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}