import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/skill_model.dart';
import '../widgets/section_header.dart';
import '../widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 680;

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
                badge: 'Expertise',
                title: 'Technical Skills & Technologies',
                subtitle:
                    'Technologies, frameworks, and programming languages I leverage to build robust applications.',
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount;
                  if (constraints.maxWidth > 1024) {
                    crossAxisCount = 4;
                  } else if (constraints.maxWidth > 680) {
                    crossAxisCount = 3;
                  } else if (constraints.maxWidth > 480) {
                    crossAxisCount = 2;
                  } else {
                    crossAxisCount = 1;
                  }

                  final skills = SkillModel.allSkills;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: isMobile ? 3.0 : 2.5,
                    ),
                    itemCount: skills.length,
                    itemBuilder: (context, index) {
                      return SkillCard(skill: skills[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
