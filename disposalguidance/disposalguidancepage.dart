import 'package:flutter/material.dart';

class DisposalGuidancePage extends StatefulWidget {
  const DisposalGuidancePage({super.key});

  @override
  State<DisposalGuidancePage> createState() => _DisposalGuidancePageState();
}

class _DisposalGuidancePageState extends State<DisposalGuidancePage> {
  final Map<String, bool> _expandedSections = {
    'Kitchen Waste': false,
    'Plant Waste': false,
    'Animal Waste': false,
    'Biogas': false,
    'Compost Pit': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32), // Rich green shade
        title: const Text(
          'Disposal Guidance',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWasteIconSection(
            title: 'Kitchen Waste',
            icon: Icons.kitchen,
            steps: [
              'Collect kitchen waste separately in a compostable bag.',
              'Compost food waste or use it to create biogas.',
              'Ensure no non-biodegradable items are included.'
            ],
          ),
          _buildWasteIconSection(
            title: 'Plant Waste',
            icon: Icons.local_florist,
            steps: [
              'Collect plant waste in separate bins.',
              'Compost plant materials or use them for mulching.',
              'Avoid mixing with non-compostable waste.'
            ],
          ),
          _buildWasteIconSection(
            title: 'Animal Waste',
            icon: Icons.pets,
            steps: [
              'Collect animal waste separately using gloves.',
              'Compost it in specialized bins for safety.',
              'Ensure proper hygiene during handling.'
            ],
          ),
          _buildWasteIconSection(
            title: 'Biogas',
            icon: Icons.bolt,
            steps: [
              'Collect organic waste suitable for biogas production.',
              'Feed the waste into a biogas digester.',
              'Maintain the digester for continuous gas production.'
            ],
          ),
          _buildWasteIconSection(
            title: 'Compost Pit',
            icon: Icons.eco,
            steps: [
              'Dig a compost pit in your garden.',
              'Layer biodegradable waste with soil.',
              'Turn the compost regularly for aeration.'
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWasteIconSection({
    required String title,
    required IconData icon,
    required List<String> steps,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            _expandedSections[title] = !_expandedSections[title]!;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: const Color(0xFF2E7D32), size: 30),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    _expandedSections[title]!
                        ? Icons.expand_less
                        : Icons.expand_more,
                    color: Colors.grey,
                  ),
                ],
              ),
              if (_expandedSections[title]!)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      steps.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${index + 1}. ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Text(steps[index]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
