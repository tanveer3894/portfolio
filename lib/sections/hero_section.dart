import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/social_icon_button.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  final VoidCallback onContactMe;
  final VoidCallback onDownloadResume;

  const HeroSection({
    Key? key,
    required this.onViewProjects,
    required this.onContactMe,
    required this.onDownloadResume,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 680;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 60 : 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Available for opportunities badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.primary.withOpacity(0.35)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Available for Software Engineering Roles',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Greeting & Name
              Text(
                AppConstants.greeting,
                style: AppTextStyles.displayLarge.copyWith(
                  fontSize: isMobile ? 32 : 54,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),

              // Role with Cyan Accent
              ShaderMask(
                shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                child: Text(
                  AppConstants.role,
                  style: AppTextStyles.displayMedium.copyWith(
                    fontSize: isMobile ? 22 : 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Description
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Text(
                  AppConstants.heroDescription,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontSize: isMobile ? 15 : 18,
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // Action Buttons
              Wrap(
                spacing: 16,
                runSpacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CustomButton(
                    text: 'View Projects',
                    icon: Icons.grid_view_rounded,
                    onPressed: onViewProjects,
                    type: ButtonType.primary,
                  ),
                  CustomButton(
                    text: 'Contact Me',
                    icon: Icons.mail_outline_rounded,
                    onPressed: onContactMe,
                    type: ButtonType.outlined,
                  ),
                  CustomButton(
                    text: 'Download Resume',
                    icon: Icons.file_download_outlined,
                    onPressed: onDownloadResume,
                    type: ButtonType.outlined,
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Social Icons + Location
              Row(
                children: [
                  const SocialIconButton(
                    icon: Icons.code_rounded,
                    tooltip: 'GitHub Profile',
                    url: AppConstants.githubUrl,
                  ),
                  const SizedBox(width: 12),
                  const SocialIconButton(
                    icon: Icons.work_outline_rounded,
                    tooltip: 'LinkedIn Profile',
                    url: AppConstants.linkedinUrl,
                  ),
                  const SizedBox(width: 24),
                  Row(
                    children: const [
                      Icon(Icons.location_on_outlined, size: 18, color: AppColors.textMuted),
                      SizedBox(width: 6),
                      Text(
                        AppConstants.location,
                        style: TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
