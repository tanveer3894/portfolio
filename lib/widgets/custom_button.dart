import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

enum ButtonType { primary, outlined, text }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final IconData? icon;
  final bool isFullWidth;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
    this.isFullWidth = false,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Widget content = Row(
      mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) ...[
          Icon(
            widget.icon,
            size: 18,
            color: widget.type == ButtonType.primary
                ? AppColors.background
                : (_isHovered ? AppColors.primary : AppColors.textPrimary),
          ),
          const SizedBox(width: 8),
        ],
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
            color: widget.type == ButtonType.primary
                ? AppColors.background
                : (_isHovered ? AppColors.primary : AppColors.textPrimary),
          ),
        ),
      ],
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            gradient: widget.type == ButtonType.primary
                ? (_isHovered
                    ? const LinearGradient(
                        colors: [Color(0xFF38BDF8), Color(0xFF0284C7)],
                      )
                    : AppColors.primaryGradient)
                : null,
            color: widget.type == ButtonType.outlined
                ? (_isHovered ? AppColors.cardBackgroundHover : Colors.transparent)
                : null,
            borderRadius: BorderRadius.circular(12),
            border: widget.type == ButtonType.outlined
                ? Border.all(
                    color: _isHovered ? AppColors.primary : AppColors.surfaceLight,
                    width: 1.5,
                  )
                : null,
            boxShadow: widget.type == ButtonType.primary && _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.35),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: content,
        ),
      ),
    );
  }
}
