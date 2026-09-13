import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String badge;
  final String title;
  final String? subtitle;
  final bool isCentered;

  const SectionHeader({
    Key? key,
    required this.badge,
    required this.title,
    this.subtitle,
    this.isCentered = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final crossAlign =
        isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = isCentered ? TextAlign.center : TextAlign.start;

    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryDark.withOpacity(0.25),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.primary.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Text(
            badge.toUpperCase(),
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: textAlign,
          style: AppTextStyles.displayMedium.copyWith(
            fontSize: MediaQuery.of(context).size.width < 600 ? 28 : 34,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              subtitle!,
              textAlign: textAlign,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textSecondary,
                fontSize: 15,
              ),
            ),
          ),
        ],
        const SizedBox(height: 36),
      ],
    );
  }
}
