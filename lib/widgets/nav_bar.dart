import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class NavBarItem {
  final String title;
  final VoidCallback onTap;

  const NavBarItem({required this.title, required this.onTap});
}

class NavBar extends StatelessWidget {
  final List<NavBarItem> items;
  final VoidCallback onResumeTap;
  final VoidCallback onMenuTap;

  const NavBar({
    Key? key,
    required this.items,
    required this.onResumeTap,
    required this.onMenuTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= AppConstants.desktopBreakpoint;

    return Container(
      height: 72,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth < 600 ? 16 : 32,
      ),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.92),
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo / Brand
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: items.isNotEmpty ? items.first.onTap : null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.4),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.flutter_dash, color: AppColors.primary, size: 18),
                            SizedBox(width: 6),
                            Text(
                              'TA',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Tanveer Ahmad',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Desktop Navigation links
              if (isDesktop) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: items.map((item) {
                    return _NavLink(title: item.title, onTap: item.onTap);
                  }).toList(),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: OutlinedButton.icon(
                    onPressed: onResumeTap,
                    icon: const Icon(Icons.file_download_outlined, size: 16),
                    label: const Text('Resume'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary, width: 1.2),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ] else ...[
                IconButton(
                  onPressed: onMenuTap,
                  icon: const Icon(Icons.menu_rounded, color: AppColors.textPrimary, size: 26),
                  tooltip: 'Open menu',
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink({required this.title, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: _isHovered ? AppColors.primary : AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                height: 2,
                width: _isHovered ? 20 : 0,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
