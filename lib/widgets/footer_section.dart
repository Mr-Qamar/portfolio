import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/url_helper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppTheme.border)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            children: [
              Text(
                PortfolioData.profile.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                '${PortfolioData.profile.title} · Built with Flutter Web',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                children: [
                  IconButton(
                    tooltip: 'GitHub',
                    onPressed: () => openUrl(PortfolioData.contact.github),
                    icon: const FaIcon(FontAwesomeIcons.github, size: 20),
                    color: AppTheme.textPrimary,
                  ),
                  IconButton(
                    tooltip: 'LinkedIn',
                    onPressed: () => openUrl(PortfolioData.contact.linkedin),
                    icon: const FaIcon(FontAwesomeIcons.linkedin, size: 20),
                    color: AppTheme.textPrimary,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                '© $year ${PortfolioData.profile.name}. All rights reserved.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => openEmail(PortfolioData.contact.email),
                child: const Text('Get in Touch'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
