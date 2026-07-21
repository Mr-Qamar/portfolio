import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_models.dart';
import '../theme/app_theme.dart';
import 'section_header.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;
    final categories = <String, List<Skill>>{};

    for (final skill in PortfolioData.skills) {
      final cat = skill.category ?? 'Other';
      categories.putIfAbsent(cat, () => []).add(skill);
    }

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
                  label: 'Skills',
                  title: 'What I Bring to the Table',
                  subtitle:
                      'Technical expertise across mobile, web, and app lifecycle management.',
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: PortfolioData.skills.map((skill) {
                    return Chip(
                      avatar: CircleAvatar(
                        backgroundColor: AppTheme.primary.withValues(alpha: 0.2),
                        child: Text(
                          '${(skill.level * 100).round()}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppTheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      label: Text(skill.name),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final crossCount = isWide ? 2 : 1;
                    
                    final cards = List.generate(categories.length, (index) {
                      final entry = categories.entries.elementAt(index);
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: AppTheme.gradientCard,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.key,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 12),
                            ...entry.value.map((skill) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(skill.name),
                                        Text(
                                          '${(skill.level * 100).round()}%',
                                          style: const TextStyle(
                                            color: AppTheme.primary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: LinearProgressIndicator(
                                        value: skill.level,
                                        minHeight: 6,
                                        backgroundColor: AppTheme.border,
                                        color: AppTheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      );
                    });

                    if (crossCount == 1) {
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
                      for (int i = 0; i < cards.length; i++) {
                        if (i % 2 == 0) {
                          if (col1.isNotEmpty) col1.add(const SizedBox(height: 20));
                          col1.add(cards[i]);
                        } else {
                          if (col2.isNotEmpty) col2.add(const SizedBox(height: 20));
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
                          const SizedBox(width: 20),
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
            ),
          ),
        ),
      ),
    );
  }
}
