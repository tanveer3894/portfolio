import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/project_model.dart';
import '../widgets/project_card.dart';
import '../widgets/section_header.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 680;
    final projects = ProjectModel.projects;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 50 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            children: [
              const SectionHeader(
                badge: 'Portfolio',
                title: 'Featured Projects',
                subtitle:
                    'Production-ready mobile applications and deep learning systems built with clean code and modern architecture.',
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 860) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: projects.map((project) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ProjectCard(project: project),
                          ),
                        );
                      }).toList(),
                    );
                  } else {
                    return Column(
                      children: projects.map((project) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: ProjectCard(project: project),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
