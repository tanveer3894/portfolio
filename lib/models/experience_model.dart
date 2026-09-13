class ExperienceModel {
  final String role;
  final String company;
  final String period;
  final String location;
  final String description;
  final List<String> technologies;

  const ExperienceModel({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.description,
    required this.technologies,
  });

  static List<ExperienceModel> get experiences => [
        const ExperienceModel(
          role: 'Software Engineering Intern',
          company: 'Vantedge AI',
          period: 'May 2026 – August 2026',
          location: 'Lahore, Pakistan',
          description:
              'Contributing to software engineering workflows, developing responsive application '
              'components, integrating APIs, and collaborating with team members on code quality '
              'and clean architecture practices.',
          technologies: [
            'Flutter',
            'Dart',
            'REST APIs',
            'Git',
            'Responsive UI',
          ],
        ),
      ];
}
