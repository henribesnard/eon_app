import 'package:flutter/material.dart';
import '../profile_mock_service.dart';

class CultureInfoStep extends StatefulWidget {
  const CultureInfoStep({super.key});

  @override
  CultureInfoStepState createState() => CultureInfoStepState();
}

class CultureInfoStepState extends State<CultureInfoStep> {
  final _formKey = GlobalKey<FormState>();
  final _fokoController = TextEditingController();
  final _languagesController = TextEditingController();
  final _religionController = TextEditingController();
  final _interestsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _fokoController,
            decoration: const InputDecoration(labelText: 'Foko'),
          ),
          TextFormField(
            controller: _languagesController,
            decoration: const InputDecoration(labelText: 'Langues'),
          ),
          TextFormField(
            controller: _religionController,
            decoration: const InputDecoration(labelText: 'Religion'),
          ),
          TextFormField(
            controller: _interestsController,
            decoration: const InputDecoration(labelText: 'Centres d\'intérêt'),
          ),
        ],
      ),
    );
  }

  bool save() {
    if (_formKey.currentState!.validate()) {
      ProfileMockService.instance.saveCultureInfo(
        CultureInfo(
          foko: _fokoController.text,
          languages: _languagesController.text,
          religion: _religionController.text,
          interests: _interestsController.text,
        ),
      );
      return true;
    }
    return false;
  }
}

