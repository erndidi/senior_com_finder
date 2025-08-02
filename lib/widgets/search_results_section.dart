import 'package:flutter/material.dart';
import '../models/senior_community.dart';

class SearchResultsSection extends StatelessWidget {
  const SearchResultsSection({super.key});

  List<SeniorCommunity> get _mockResults => [
        SeniorCommunity(
          name: 'Sunset Manor Senior Living',
          address: '123 Oak Street, Springfield, IL 62701',
          phoneNumber: '(555) 123-4567',
          contact: 'Sarah Johnson, Director',
          email: 'info@sunsetmanor.com',
          hours: 'Mon-Fri 9AM-5PM, Sat 10AM-2PM',
          website: 'www.sunsetmanor.com',
          marketingCopy: 'Experience luxury senior living with our state-of-the-art facilities, gourmet dining, and comprehensive care services. Our community offers a vibrant lifestyle with endless opportunities for social engagement and personal growth.',
          rating: 4.5,
          reviewCount: 127,
        ),
        SeniorCommunity(
          name: 'Golden Years Community',
          address: '456 Maple Drive, Springfield, IL 62702',
          phoneNumber: '(555) 987-6543',
          contact: 'Michael Davis, Administrator',
          email: 'contact@goldenyears.org',
          hours: 'Daily 8AM-6PM',
          website: 'www.goldenyears.org',
          marketingCopy: 'Discover comfort and care in our welcoming community. We provide personalized assistance while maintaining your independence and dignity.',
          rating: 4.2,
          reviewCount: 89,
        ),
        SeniorCommunity(
          name: 'Heritage Hills Assisted Living',
          address: '789 Pine Road, Springfield, IL 62703',
          phoneNumber: '(555) 456-7890',
          email: 'welcome@heritagehills.net',
          hours: 'Mon-Sun 24/7 (Emergency), Office: 8AM-5PM',
          website: 'www.heritagehills.net',
          marketingCopy: 'Where tradition meets modern care. Our experienced staff provides compassionate support in a homelike environment.',
          rating: 4.8,
          reviewCount: 203,
        ),
      ];

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
              'Search Results',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              '${_mockResults.length} communities found',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            ..._mockResults.map((community) => _buildResultCard(community)),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                border: Border.all(color: Colors.orange.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Terms of Service: False reviews are strictly prohibited. All reviews must be from verified residents or their families. Violation of this policy may result in account suspension and legal action.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(SeniorCommunity community) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    community.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                if (community.rating != null)
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${community.rating}/5.0',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ' (${community.reviewCount} reviews)',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.location_on, community.address),
            _buildInfoRow(Icons.phone, community.phoneNumber),
            if (community.contact != null)
              _buildInfoRow(Icons.person, community.contact!),
            if (community.email != null)
              _buildInfoRow(Icons.email, community.email!),
            if (community.hours != null)
              _buildInfoRow(Icons.access_time, community.hours!),
            if (community.website != null)
              _buildInfoRow(Icons.web, community.website!),
            if (community.marketingCopy != null) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  community.marketingCopy!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade800,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey.shade600),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}