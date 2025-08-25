import 'package:flutter/material.dart';
import 'steps/photo_step.dart';
import 'steps/personal_info_step.dart';
import 'steps/culture_info_step.dart';
import 'steps/preference_step.dart';

class ProfileFlowPage extends StatefulWidget {
  const ProfileFlowPage({super.key});

  @override
  State<ProfileFlowPage> createState() => _ProfileFlowPageState();
}

class _ProfileFlowPageState extends State<ProfileFlowPage> {
  int _currentStep = 0;
  final _photoKey = GlobalKey<PhotoStepState>();
  final _personalKey = GlobalKey<PersonalInfoStepState>();
  final _cultureKey = GlobalKey<CultureInfoStepState>();
  final _preferenceKey = GlobalKey<PreferenceStepState>();

  void _continue() {
    bool success = false;
    switch (_currentStep) {
      case 0:
        success = _photoKey.currentState?.save() ?? false;
        break;
      case 1:
        success = _personalKey.currentState?.save() ?? false;
        break;
      case 2:
        success = _cultureKey.currentState?.save() ?? false;
        break;
      case 3:
        success = _preferenceKey.currentState?.save() ?? false;
        break;
    }
    if (success && _currentStep < 3) {
      setState(() {
        _currentStep += 1;
      });
    }
  }

  void _cancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _currentStep,
      onStepContinue: _continue,
      onStepCancel: _cancel,
      steps: [
        Step(title: const Text('Photo'), content: PhotoStep(key: _photoKey)),
        Step(
            title: const Text('Infos personnelles'),
            content: PersonalInfoStep(key: _personalKey)),
        Step(
            title: const Text('Culture'),
            content: CultureInfoStep(key: _cultureKey)),
        Step(
            title: const Text('Préférences'),
            content: PreferenceStep(key: _preferenceKey)),
      ],
    );
  }
}

