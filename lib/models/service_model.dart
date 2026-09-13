import 'package:flutter/material.dart';

class ServiceModel {
  final String title;
  final String description;
  final IconData icon;

  const ServiceModel({
    required this.title,
    required this.description,
    required this.icon,
  });

  static List<ServiceModel> get services => [
        const ServiceModel(
          title: 'Flutter Mobile App Development',
          description:
              'Building performant, native-quality cross-platform applications for iOS and Android using clean Dart and Flutter practices.',
          icon: Icons.phone_android_rounded,
        ),
        const ServiceModel(
          title: 'Responsive UI Development',
          description:
              'Crafting responsive, pixel-perfect user interfaces that adapt fluidly across mobile, tablet, and web screen dimensions.',
          icon: Icons.laptop_mac_rounded,
        ),
        const ServiceModel(
          title: 'REST API Integration',
          description:
              'Connecting frontend applications with robust backend APIs, handling JSON serialization, caching, error states, and pagination.',
          icon: Icons.cloud_sync_rounded,
        ),
        const ServiceModel(
          title: 'Firebase Integration',
          description:
              'Integrating Firebase Authentication, Cloud Firestore, Realtime Database, Cloud Storage, and push notifications.',
          icon: Icons.cloud_queue_rounded,
        ),
        const ServiceModel(
          title: 'State Management',
          description:
              'Architecting predictable, scalable state management solutions leveraging Provider, GetX, or standard reactive flows.',
          icon: Icons.account_tree_outlined,
        ),
        const ServiceModel(
          title: 'Bug Fixing & App Improvements',
          description:
              'Diagnosing performance bottlenecks, fixing UI rendering bugs, refactoring legacy codebases, and updating dependencies.',
          icon: Icons.build_circle_outlined,
        ),
      ];
}
