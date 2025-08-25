import 'package:flutter/material.dart';

class PersonalInfo {
  final String bio;
  final String profession;
  final String education;
  final String city;
  final String region;

  PersonalInfo({
    required this.bio,
    required this.profession,
    required this.education,
    required this.city,
    required this.region,
  });
}

class CultureInfo {
  final String foko;
  final String languages;
  final String religion;
  final String interests;

  CultureInfo({
    required this.foko,
    required this.languages,
    required this.religion,
    required this.interests,
  });
}

class PreferenceInfo {
  final int minAge;
  final int maxAge;
  final double maxDistance;
  final String languageFilter;

  PreferenceInfo({
    required this.minAge,
    required this.maxAge,
    required this.maxDistance,
    required this.languageFilter,
  });
}

class ProfileMockService {
  ProfileMockService._internal();
  static final ProfileMockService instance = ProfileMockService._internal();

  String? photoPath;
  PersonalInfo? personalInfo;
  CultureInfo? cultureInfo;
  PreferenceInfo? preferenceInfo;

  void savePhoto(String path) {
    photoPath = path;
  }

  void savePersonalInfo(PersonalInfo info) {
    personalInfo = info;
  }

  void saveCultureInfo(CultureInfo info) {
    cultureInfo = info;
  }

  void savePreferenceInfo(PreferenceInfo info) {
    preferenceInfo = info;
  }
}

