import 'package:flutter/material.dart';
import '../widgets/search_address_section.dart';
import '../widgets/amenities_search_section.dart';
import '../widgets/search_results_section.dart';

class SpecificInfoScreen extends StatefulWidget {
  const SpecificInfoScreen({super.key});

  @override
  State<SpecificInfoScreen> createState() => _SpecificInfoScreenState();
}

class _SpecificInfoScreenState extends State<SpecificInfoScreen> {
  bool _showResults = false;

  void _onSearch() {
    setState(() {
      _showResults = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchAddressSection(onSearch: _onSearch),
            const SizedBox(height: 20),
            const AmenitiesSearchSection(),
            const SizedBox(height: 20),
            if (_showResults) const SearchResultsSection(),
          ],
        ),
      ),
    );
  }
}