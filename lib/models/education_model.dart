class EducationModel {
  final String degree;
  final String institution;
  final String period;
  final String cgpa;
  final String location;
  final List<String> coursework;

  const EducationModel({
    required this.degree,
    required this.institution,
    required this.period,
    required this.cgpa,
    required this.location,
    required this.coursework,
  });

  static List<EducationModel> get educationList => [
        const EducationModel(
          degree: 'BS Information Technology',
          institution: 'University of Education Lahore',
          period: 'August 2022 – June 2026',
          cgpa: '3.35 / 4.0',
          location: 'Lahore, Pakistan',
          coursework: [
            'Object-Oriented Programming (OOP)',
            'Data Structures & Algorithms (DSA)',
            'Software Engineering',
            'Database Systems',
            'Mobile Application Development',
            'Computer Networks',
          ],
        ),
      ];
}
