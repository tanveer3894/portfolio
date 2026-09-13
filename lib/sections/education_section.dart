import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/education_model.dart';
import '../widgets/education_card.dart';
import '../widgets/section_header.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 680;
    final educationList = EducationModel.educationList;

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
                badge: 'Academic Background',
                title: 'Education',
                subtitle:
                    'Formal computing and software engineering degree with strong academic performance.',
                isCentered: false,
              ),
              ...educationList.map((edu) {
                return EducationCard(education: edu);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
