import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'project_card.dart';
import 'section_header.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;
    final featured = PortfolioData.featuredProjects;
    final others = PortfolioData.otherProjects;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 40 : 24,
        vertical: isWide ? AppTheme.sectionPadding : AppTheme.mobileSectionPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                label: 'Portfolio',
                title: 'Featured Projects',
                subtitle:
                    'Real apps built for Android, iOS, Desktop & Web — each solving a specific business need.',
              ),
              const SizedBox(height: 40),

              // ── TOP 3 FEATURED ─────────────────────────────────
              const _SectionLabel(label: '🏆 Top 3 Projects'),
              const SizedBox(height: 20),
              ...List.generate(featured.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: FeaturedProjectCard(
                    project: featured[index],
                    index: index,
                  ),
                );
              }),

              // ── ALL OTHER PROJECTS ──────────────────────────────
              if (others.isNotEmpty) ...[
                const SizedBox(height: 16),
                const _SectionLabel(label: '📱 More Projects'),
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final crossCount = constraints.maxWidth >= 700 ? 2 : 1;
                    final cards = others
                        .map((p) => ProjectCard(project: p))
                        .toList();

                    if (crossCount == 1) {
                      final col = <Widget>[];
                      for (final card in cards) {
                        if (col.isNotEmpty) col.add(const SizedBox(height: 24));
                        col.add(card);
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: col,
                      );
                    } else {
                      final col1 = <Widget>[];
                      final col2 = <Widget>[];
                      for (int i = 0; i < cards.length; i++) {
                        if (i % 2 == 0) {
                          if (col1.isNotEmpty) col1.add(const SizedBox(height: 24));
                          col1.add(cards[i]);
                        } else {
                          if (col2.isNotEmpty) col2.add(const SizedBox(height: 24));
                          col2.add(cards[i]);
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
                          const SizedBox(width: 24),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: col2,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
      ),
    );
  }
}
