import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/service_model.dart';
import '../widgets/section_header.dart';
import '../widgets/service_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 680;
    final services = ServiceModel.services;

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
                badge: 'What I Offer',
                title: 'Engineering Services',
                subtitle:
                    'Professional development capabilities tailored for startups, agencies, and engineering teams.',
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount;
                  if (constraints.maxWidth > 960) {
                    crossAxisCount = 3;
                  } else if (constraints.maxWidth > 640) {
                    crossAxisCount = 2;
                  } else {
                    crossAxisCount = 1;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: isMobile ? 1.15 : 1.35,
                    ),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return ServiceCard(service: services[index]);
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
