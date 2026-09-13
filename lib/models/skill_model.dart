import 'package:flutter/material.dart';

class SkillModel {
  final String name;
  final String category;
  final IconData icon;

  const SkillModel({
    required this.name,
    required this.category,
    required this.icon,
  });

  static List<SkillModel> get allSkills => [
        const SkillModel(
          name: 'Flutter',
          category: 'Mobile & Frontend',
          icon: Icons.flutter_dash,
        ),
        const SkillModel(
          name: 'Dart',
          category: 'Languages',
          icon: Icons.code_rounded,
        ),
        const SkillModel(
          name: 'Firebase',
          category: 'Backend & Cloud',
          icon: Icons.local_fire_department_rounded,
        ),
        const SkillModel(
          name: 'REST APIs',
          category: 'Networking',
          icon: Icons.sync_alt_rounded,
        ),
        const SkillModel(
          name: 'Provider',
          category: 'State Management',
          icon: Icons.architecture_rounded,
        ),
        const SkillModel(
          name: 'GetX',
          category: 'State Management',
          icon: Icons.bolt_rounded,
        ),
        const SkillModel(
          name: 'Git & GitHub',
          category: 'Version Control',
          icon: Icons.merge_type_rounded,
        ),
        const SkillModel(
          name: 'Responsive UI',
          category: 'UI/UX Design',
          icon: Icons.devices_rounded,
        ),
        const SkillModel(
          name: 'Clean Architecture',
          category: 'Design Patterns',
          icon: Icons.layers_rounded,
        ),
        const SkillModel(
          name: 'Python',
          category: 'Languages',
          icon: Icons.terminal_rounded,
        ),
        const SkillModel(
          name: 'Java',
          category: 'Languages',
          icon: Icons.coffee_rounded,
        ),
        const SkillModel(
          name: 'OOP',
          category: 'Foundations',
          icon: Icons.category_rounded,
        ),
        const SkillModel(
          name: 'DSA',
          category: 'Foundations',
          icon: Icons.account_tree_rounded,
        ),
        const SkillModel(
          name: 'Postman',
          category: 'Testing & Tools',
          icon: Icons.send_rounded,
        ),
      ];
}
