import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/experience_model.dart';
import '../widgets/experience_timeline_tile.dart';
import '../widgets/section_header.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 680;
    final experiences = ExperienceModel.experiences;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 50 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                badge: 'Career Journey',
                title: 'Work Experience',
                subtitle:
                    'Hands-on industry experience collaborating with engineering teams and building software.',
                isCentered: false,
              ),
              Column(
                children: List.generate(experiences.length, (index) {
                  return ExperienceTimelineTile(
                    experience: experiences[index],
                    isLast: index == experiences.length - 1,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
