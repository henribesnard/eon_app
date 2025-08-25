import 'package:flutter/material.dart';
import '../profile_mock_service.dart';

class PersonalInfoStep extends StatefulWidget {
  const PersonalInfoStep({super.key});

  @override
  PersonalInfoStepState createState() => PersonalInfoStepState();
}

class PersonalInfoStepState extends State<PersonalInfoStep> {
  final _formKey = GlobalKey<FormState>();
  final _bioController = TextEditingController();
  final _professionController = TextEditingController();
  final _educationController = TextEditingController();
  final _cityController = TextEditingController();
  final _regionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _bioController,
            decoration: const InputDecoration(labelText: 'Bio'),
          ),
          TextFormField(
            controller: _professionController,
            decoration: const InputDecoration(labelText: 'Profession'),
          ),
          TextFormField(
            controller: _educationController,
            decoration: const InputDecoration(labelText: 'Éducation'),
          ),
          TextFormField(
            controller: _cityController,
            decoration: const InputDecoration(labelText: 'Ville'),
          ),
          TextFormField(
            controller: _regionController,
            decoration: const InputDecoration(labelText: 'Région'),
          ),
        ],
      ),
    );
  }

  bool save() {
    if (_formKey.currentState!.validate()) {
      ProfileMockService.instance.savePersonalInfo(
        PersonalInfo(
          bio: _bioController.text,
          profession: _professionController.text,
          education: _educationController.text,
          city: _cityController.text,
          region: _regionController.text,
        ),
      );
      return true;
    }
    return false;
  }
}

