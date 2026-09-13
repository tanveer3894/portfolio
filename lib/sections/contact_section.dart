import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/social_icon_button.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSending = false;
  bool _isSuccess = false;

  // ==========================================
  // EMAILJS CONFIGURATION
  // ==========================================

  static const String _serviceId = 'service_ewg94sb';
  static const String _templateId = 'template_1pgzz2s';
  static const String _publicKey = 'vsCdUTpp9mxBHe5U5';
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // ==========================================
  // SEND MESSAGE
  // ==========================================

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSending = true;
      _isSuccess = false;
    });

    final templateParams = {
      'title': 'Portfolio Contact Form',
      'name': _nameController.text.trim(),
      'email': _emailController.text.trim(),
      'subject': _subjectController.text.trim(),
      'message': _messageController.text.trim(),
    };

    try {
      final response = await http.post(
        Uri.parse(
          'https://api.emailjs.com/api/v1.0/email/send',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'service_id': _serviceId,
          'template_id': _templateId,
          'user_id': _publicKey,
          'template_params': templateParams,
        }),
      );

      debugPrint('EmailJS Status: ${response.statusCode}');
      debugPrint('EmailJS Response: ${response.body}');

      if (response.statusCode == 200) {
        if (!mounted) return;

        setState(() {
          _isSending = false;
          _isSuccess = true;
        });

        _nameController.clear();
        _emailController.clear();
        _subjectController.clear();
        _messageController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Message sent successfully!'),
          ),
        );
      } else {
        if (!mounted) return;

        setState(() {
          _isSending = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to send message: ${response.body}',
            ),
          ),
        );
      }
    } catch (error) {
      debugPrint('EmailJS Error: $error');

      if (!mounted) return;

      setState(() {
        _isSending = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Something went wrong. Please try again.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 50 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppConstants.maxContentWidth,
          ),
          child: Column(
            children: [
              const SectionHeader(
                badge: 'Get in Touch',
                title: 'Contact & Collaboration',
                subtitle:
                'Interested in discussing Flutter engineering opportunities, projects, or technical collaboration? Send a message below.',
              ),

              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 880) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ==========================================
                        // LEFT SIDE
                        // ==========================================

                        Expanded(
                          flex: 4,
                          child: GlassCard(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Let's Build Together",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textPrimary,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                Text(
                                  'Feel free to connect on GitHub, LinkedIn, or send a message directly using the inquiry form.',
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.textSecondary,
                                    height: 1.6,
                                  ),
                                ),

                                const SizedBox(height: 32),

                                const Text(
                                  'Profiles & Links:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                    letterSpacing: 0.5,
                                  ),
                                ),

                                const SizedBox(height: 14),

                                const Row(
                                  children:  [
                                    SocialIconButton(
                                      icon: Icons.code_rounded,
                                      tooltip: 'GitHub: tanveer3894',
                                      url: AppConstants.githubUrl,
                                    ),
                                    SizedBox(width: 12),
                                    SocialIconButton(
                                      icon: Icons.work_outline_rounded,
                                      tooltip: 'LinkedIn Profile',
                                      url: AppConstants.linkedinUrl,
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 32),

                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppColors.surface,
                                    borderRadius:
                                    BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColors.border,
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: AppColors.primary,
                                        size: 20,
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        AppConstants.location,
                                        style: TextStyle(
                                          color: AppColors.textPrimary,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 24),

                        // ==========================================
                        // RIGHT SIDE - CONTACT FORM
                        // ==========================================

                        Expanded(
                          flex: 6,
                          child: GlassCard(
                            padding: const EdgeInsets.all(32),
                            child: _buildForm(),
                          ),
                        ),
                      ],
                    );
                  }

                  // ==========================================
                  // MOBILE / TABLET
                  // ==========================================

                  return Column(
                    children: [
                      const GlassCard(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                             Text(
                              "Let's Connect",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              'Reach out on social profiles or send a direct inquiry.',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 13,
                              ),
                            ),

                             SizedBox(height: 16),

                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              crossAxisAlignment:
                              WrapCrossAlignment.center,
                              children: [
                                SocialIconButton(
                                  icon: Icons.code_rounded,
                                  tooltip: 'GitHub',
                                  url: AppConstants.githubUrl,
                                ),
                                SocialIconButton(
                                  icon: Icons.work_outline_rounded,
                                  tooltip: 'LinkedIn',
                                  url: AppConstants.linkedinUrl,
                                ),
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.textMuted,
                                  size: 16,
                                ),
                                Text(
                                  AppConstants.location,
                                  style: TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      GlassCard(
                        padding: const EdgeInsets.all(24),
                        child: _buildForm(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================
  // CONTACT FORM
  // ==========================================

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Send a Message',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 20),

          // ==========================================
          // NAME + EMAIL
          // ==========================================

          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 500) {
                return Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Your Name',
                        hintText: 'e.g. Alex Morgan',
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          size: 20,
                        ),
                      ),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Your Email',
                        hintText: 'e.g. alex@example.com',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: 20,
                        ),
                      ),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'Please enter your email';
                        }

                        if (!v.contains('@')) {
                          return 'Enter a valid email';
                        }

                        return null;
                      },
                    ),
                  ],
                );
              }

              return Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Your Name',
                        hintText: 'e.g. Alex Morgan',
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          size: 20,
                        ),
                      ),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'Please enter your name';
                        }

                        return null;
                      },
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Your Email',
                        hintText: 'e.g. alex@example.com',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: 20,
                        ),
                      ),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'Please enter your email';
                        }

                        if (!v.contains('@')) {
                          return 'Enter a valid email';
                        }

                        return null;
                      },
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 16),

          // ==========================================
          // SUBJECT
          // ==========================================

          TextFormField(
            controller: _subjectController,
            decoration: const InputDecoration(
              labelText: 'Subject',
              hintText: 'e.g. Flutter Project / Opportunity Inquiry',
              prefixIcon: Icon(
                Icons.subject_rounded,
                size: 20,
              ),
            ),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Please enter a subject';
              }

              return null;
            },
          ),

          const SizedBox(height: 16),

          // ==========================================
          // MESSAGE
          // ==========================================

          TextFormField(
            controller: _messageController,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Message',
              hintText: 'Write your message or inquiry here...',
              alignLabelWithHint: true,
            ),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Please enter your message';
              }

              return null;
            },
          ),

          const SizedBox(height: 24),

          // ==========================================
          // SUCCESS MESSAGE
          // ==========================================

          if (_isSuccess)
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.success.withValues(alpha: 0.3),
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: AppColors.success,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Thank you! Your message has been sent successfully.',
                      style: TextStyle(
                        color: AppColors.success,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // ==========================================
          // SEND BUTTON
          // ==========================================

          CustomButton(
            text: _isSending
                ? 'Sending...'
                : 'Send Message',
            icon: Icons.send_rounded,
            onPressed: _isSending
                ? () {}
                : _submitForm,
            isFullWidth: true,
          ),
        ],
      ),
    );
  }
}