import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/url_helper.dart';
import 'section_header.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final contact = PortfolioData.contact;
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 40 : 24,
        vertical:
            isWide ? AppTheme.sectionPadding : AppTheme.mobileSectionPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                label: 'Contact',
                title: 'Let\'s Work Together',
                subtitle:
                    'Have a project in mind? Reach out — I\'d love to hear about it.',
              ),
              const SizedBox(height: 40),
              if (isWide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF164E63),
                              AppTheme.surface,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppTheme.border),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ready to build something amazing?',
                              style:
                                  Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Whether you need a custom app, help publishing to stores, '
                              'or ongoing maintenance — I\'m here to help turn your vision into reality.',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 28),
                            ElevatedButton.icon(
                              onPressed: () => openEmail(contact.email),
                              icon: const Icon(Icons.send, size: 18),
                              label: const Text('Send Email'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Column(
                        children: [
                          _ContactTile(
                            icon: Icons.email_outlined,
                            label: 'Email',
                            value: contact.email,
                            onTap: () => openEmail(contact.email),
                          ),
                          _ContactTile(
                            icon: Icons.phone_outlined,
                            label: 'Phone',
                            value: contact.phone,
                            onTap: () => openPhone(context, contact.phone),
                          ),
                          _ContactTile(
                            icon: Icons.location_on_outlined,
                            label: 'Location',
                            value: contact.location,
                          ),
                          _ContactTile(
                            icon: FontAwesomeIcons.linkedin,
                            label: 'LinkedIn',
                            value: 'Connect on LinkedIn',
                            onTap: () => openUrl(contact.linkedin),
                          ),
                          _ContactTile(
                            icon: FontAwesomeIcons.github,
                            label: 'GitHub',
                            value: 'View my code',
                            onTap: () => openUrl(contact.github),
                          ),
                          _ContactTile(
                            icon: FontAwesomeIcons.whatsapp,
                            label: 'WhatsApp',
                            value: 'Chat on WhatsApp',
                            onTap: () => openUrl(contact.whatsapp),
                            accentColor: const Color(0xFF25D366),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF164E63),
                            AppTheme.surface,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppTheme.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ready to build something amazing?',
                            style:
                                Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Whether you need a custom app, help publishing to stores, '
                            'or ongoing maintenance — I\'m here to help turn your vision into reality.',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 28),
                          ElevatedButton.icon(
                            onPressed: () => openEmail(contact.email),
                            icon: const Icon(Icons.send, size: 18),
                            label: const Text('Send Email'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        _ContactTile(
                          icon: Icons.email_outlined,
                          label: 'Email',
                          value: contact.email,
                          onTap: () => openEmail(contact.email),
                        ),
                        _ContactTile(
                          icon: Icons.phone_outlined,
                          label: 'Phone',
                          value: contact.phone,
                          onTap: () => openPhone(context, contact.phone),
                        ),
                        _ContactTile(
                          icon: Icons.location_on_outlined,
                          label: 'Location',
                          value: contact.location,
                        ),
                        _ContactTile(
                          icon: FontAwesomeIcons.linkedin,
                          label: 'LinkedIn',
                          value: 'Connect on LinkedIn',
                          onTap: () => openUrl(contact.linkedin),
                        ),
                        _ContactTile(
                          icon: FontAwesomeIcons.github,
                          label: 'GitHub',
                          value: 'View my code',
                          onTap: () => openUrl(contact.github),
                        ),
                        _ContactTile(
                          icon: FontAwesomeIcons.whatsapp,
                          label: 'WhatsApp',
                          value: 'Chat on WhatsApp',
                          onTap: () => openUrl(contact.whatsapp),
                          accentColor: const Color(0xFF25D366),
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

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
    this.accentColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    final color = accentColor ?? AppTheme.primary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppTheme.border),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.textSecondary,
                            ),
                      ),
                      Text(
                        value,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.textPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                if (onTap != null)
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppTheme.textSecondary,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
