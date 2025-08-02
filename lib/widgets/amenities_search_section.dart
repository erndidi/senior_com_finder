import 'package:flutter/material.dart';

class AmenitiesSearchSection extends StatefulWidget {
  const AmenitiesSearchSection({super.key});

  @override
  State<AmenitiesSearchSection> createState() => _AmenitiesSearchSectionState();
}

class _AmenitiesSearchSectionState extends State<AmenitiesSearchSection> {
  final Map<String, bool> _selectedAmenities = {};

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search Amenities',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildAmenitySection(
                        'Safety and Monitoring',
                        [
                          '24/7 monitoring',
                          'On-site staff',
                          'On-site nurses and/or physicians',
                          'Medical emergency systems',
                        ],
                        Colors.red.shade100,
                      ),
                      const SizedBox(height: 16),
                      _buildAmenitySection(
                        'Social and Lifestyle Activities',
                        [
                          'Social events',
                          'Classes (art, fitness, computing)',
                          'Clubs',
                          'Field trips',
                          'Cultural activities',
                          'On-demand meals',
                        ],
                        Colors.green.shade100,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      _buildAmenitySection(
                        'Physical Amenities',
                        [
                          'Gym',
                          'Pool',
                          'Dining halls',
                          'On-site salons',
                          'Communal lounges',
                          'Walking paths',
                          'Gardens',
                        ],
                        Colors.blue.shade100,
                      ),
                      const SizedBox(height: 16),
                      _buildAmenitySection(
                        'Levels of Care',
                        [
                          'Independent living',
                          'Assisted living',
                          'Memory/dementia care',
                        ],
                        Colors.orange.shade100,
                      ),
                      const SizedBox(height: 16),
                      _buildAmenitySection(
                        'Specialized Services and Inclusivity',
                        [
                          'On-site worship',
                          'LGBTQ+ inclusive',
                        ],
                        Colors.purple.shade100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmenitySection(
    String title,
    List<String> amenities,
    Color backgroundColor,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...amenities.map((amenity) => _buildCheckboxItem(amenity)),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxItem(String amenity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Checkbox(
            value: _selectedAmenities[amenity] ?? false,
            onChanged: (bool? value) {
              setState(() {
                _selectedAmenities[amenity] = value ?? false;
              });
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          Expanded(
            child: Text(
              amenity,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}