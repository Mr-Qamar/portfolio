import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_header.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  IconData _iconFor(String name) {
    return switch (name) {
      'devices' => Icons.devices,
      'business' => Icons.business_center_outlined,
      'store' => Icons.storefront_outlined,
      'build' => Icons.build_circle_outlined,
      'cloud' => Icons.cloud_outlined,
      'palette' => Icons.palette_outlined,
      'extension' => Icons.extension_outlined,
      _ => Icons.star_outline,
    };
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    return Container(
      width: double.infinity,
      color: AppTheme.surface.withValues(alpha: 0.5),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isWide ? 40 : 24,
          vertical:
              isWide ? AppTheme.sectionPadding : AppTheme.mobileSectionPadding,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionHeader(
                  label: 'Services',
                  title: 'How I Can Help Your Business',
                  subtitle:
                      'From idea to App Store — development, publishing, and long-term support.',
                ),
                const SizedBox(height: 40),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final cards = List.generate(PortfolioData.services.length, (index) {
                      final service = PortfolioData.services[index];
                      return Container(
                        padding: const EdgeInsets.all(24),
                        decoration: AppTheme.gradientCard,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppTheme.primary.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                _iconFor(service.iconName),
                                color: AppTheme.primary,
                                size: 28,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              service.title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              service.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      );
                    });

                    if (!isWide) {
                      final col = <Widget>[];
                      for (final card in cards) {
                        if (col.isNotEmpty) col.add(const SizedBox(height: 20));
                        col.add(card);
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: col,
                      );
                    } else {
                      final col1 = <Widget>[];
                      final col2 = <Widget>[];
                      final col3 = <Widget>[];
                      for (int i = 0; i < cards.length; i++) {
                        final card = cards[i];
                        if (i % 3 == 0) {
                          if (col1.isNotEmpty) col1.add(const SizedBox(height: 20));
                          col1.add(card);
                        } else if (i % 3 == 1) {
                          if (col2.isNotEmpty) col2.add(const SizedBox(height: 20));
                          col2.add(card);
                        } else {
                          if (col3.isNotEmpty) col3.add(const SizedBox(height: 20));
                          col3.add(card);
                        }
                      }
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: col1,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: col2,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: col3,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
