import 'package:flutter/material.dart';
import '../profile_mock_service.dart';

class PreferenceStep extends StatefulWidget {
  const PreferenceStep({super.key});

  @override
  PreferenceStepState createState() => PreferenceStepState();
}

class PreferenceStepState extends State<PreferenceStep> {
  RangeValues _ageRange = const RangeValues(18, 30);
  double _distance = 10;
  final _languageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Tranche d\'âge'),
        RangeSlider(
          values: _ageRange,
          min: 18,
          max: 100,
          divisions: 82,
          labels: RangeLabels(
            _ageRange.start.round().toString(),
            _ageRange.end.round().toString(),
          ),
          onChanged: (values) {
            setState(() {
              _ageRange = values;
            });
          },
        ),
        const SizedBox(height: 16),
        Text('Distance: ${_distance.round()} km'),
        Slider(
          value: _distance,
          min: 1,
          max: 100,
          divisions: 99,
          label: _distance.round().toString(),
          onChanged: (v) {
            setState(() {
              _distance = v;
            });
          },
        ),
        TextField(
          controller: _languageController,
          decoration:
              const InputDecoration(labelText: 'Filtres linguistiques'),
        ),
      ],
    );
  }

  bool save() {
    ProfileMockService.instance.savePreferenceInfo(
      PreferenceInfo(
        minAge: _ageRange.start.round(),
        maxAge: _ageRange.end.round(),
        maxDistance: _distance,
        languageFilter: _languageController.text,
      ),
    );
    return true;
  }
}

