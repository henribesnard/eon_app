import 'package:flutter/material.dart';
import '../profile_mock_service.dart';

class PhotoStep extends StatefulWidget {
  const PhotoStep({super.key});

  @override
  PhotoStepState createState() => PhotoStepState();
}

class PhotoStepState extends State<PhotoStep> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          color: Colors.grey.shade300,
          child: _selected
              ? const Icon(Icons.check, size: 80)
              : const Icon(Icons.person, size: 80),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _selected = true;
            });
          },
          child: const Text('Select from gallery'),
        ),
      ],
    );
  }

  bool save() {
    if (_selected) {
      ProfileMockService.instance.savePhoto('placeholder');
      return true;
    }
    return false;
  }
}

