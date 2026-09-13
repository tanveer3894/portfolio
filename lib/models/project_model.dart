import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String description;
  final List<String> technologies;
  final String githubUrl;
  final IconData icon;
  final String category;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    required this.githubUrl,
    required this.icon,
    this.category = 'Featured Project',
  });

  static List<ProjectModel> get projects => [
        const ProjectModel(
          title: 'Flutter E-Commerce App',
          description:
              'A responsive e-commerce mobile application built with Flutter and Dart. '
              'The application integrates REST APIs for product data and includes authentication, '
              'product browsing, cart management, wishlist functionality, search and filtering, '
              'checkout flow, and Firebase Authentication.',
          technologies: [
            'Flutter',
            'Dart',
            'Provider',
            'REST API',
            'Firebase Auth',
            'SharedPreferences',
          ],
          githubUrl: 'https://github.com/tanveer3894/flutter-ecommerce-app',
          icon: Icons.shopping_bag_outlined,
          category: 'Mobile Application',
        ),
        const ProjectModel(
          title: 'Retinal Disease Detection',
          description:
              'An AI-based retinal disease detection project developed as a final-year project '
              'using deep learning and computer vision techniques. The system classifies retinal '
              'images into multiple disease categories.',
          technologies: [
            'Python',
            'TensorFlow',
            'OpenCV',
            'CNN',
            'Flask',
          ],
          githubUrl: 'https://github.com/tanveer3894/retinal-disease-detection',
          icon: Icons.remove_red_eye_outlined,
          category: 'AI & Computer Vision',
        ),
      ];
}
