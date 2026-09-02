import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_models.dart';
import '../theme/app_theme.dart';
import 'section_header.dart';

class _SkillLane {
  const _SkillLane({
    required this.key,
    required this.title,
    required this.blurb,
    required this.icon,
    required this.accent,
  });

  final String key;
  final String title;
  final String blurb;
  final IconData icon;
  final Color accent;
}

const _lanes = [
  _SkillLane(
    key: 'Mobile',
    title: 'Flutter & apps',
    blurb: 'One codebase to phones, desktop, and web — the product, not just the UI.',
    icon: Icons.phone_iphone_rounded,
    accent: AppTheme.primary,
  ),
  _SkillLane(
    key: 'AI',
    title: 'AI & vision',
    blurb: 'Neural nets I actually train and ship: detection, sequences, and attention.',
    icon: Icons.auto_awesome,
    accent: Color(0xFFA78BFA),
  ),
  _SkillLane(
    key: 'LLM',
    title: 'Agents & MCP',
    blurb: 'LangChain / LangGraph graphs, tool calling, and MCP servers wired to real apps.',
    icon: Icons.hub_outlined,
    accent: Color(0xFF34D399),
  ),
  _SkillLane(
    key: 'Backend',
    title: 'APIs & data',
    blurb: 'FastAPI, Firebase, Supabase — backends that keep CRM, field apps, and extensions live.',
    icon: Icons.cloud_outlined,
    accent: Color(0xFF38BDF8),
  ),
  _SkillLane(
    key: 'Languages',
    title: 'Languages',
    blurb: 'Dart first, then the languages AI and Android still need.',
    icon: Icons.code_rounded,
    accent: Color(0xFFFBBF24),
  ),
  _SkillLane(
    key: 'Web',
    title: 'Web & shipping',
    blurb: 'Chrome extensions, store listings, and keeping production apps alive.',
    icon: Icons.rocket_launch_outlined,
    accent: Color(0xFFF472B6),
  ),
];

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;
    final byCategory = <String, List<Skill>>{};
    for (final skill in PortfolioData.skills) {
      final cat = skill.category ?? 'Other';
      byCategory.putIfAbsent(cat, () => []).add(skill);
    }

    final devops = byCategory['DevOps'] ?? const <Skill>[];
    final webItems = [...?byCategory['Web'], ...devops];

    List<Skill> itemsFor(_SkillLane lane) {
      if (lane.key == 'Web') return webItems;
      return byCategory[lane.key] ?? const <Skill>[];
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
                      'Flutter products, neural nets, and LLM tooling — the stack I ship with, not a percent bar.',
                ),
                const SizedBox(height: 36),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final cols = constraints.maxWidth >= 1100
                        ? 3
                        : (constraints.maxWidth >= 700 ? 2 : 1);
                    final gap = 16.0;
                    final tileW =
                        (constraints.maxWidth - gap * (cols - 1)) / cols;

                    return Wrap(
                      spacing: gap,
                      runSpacing: gap,
                      children: [
                        for (var i = 0; i < _lanes.length; i++)
                          SizedBox(
                            width: tileW,
                            child: _SkillLaneCard(
                              lane: _lanes[i],
                              skills: itemsFor(_lanes[i]),
                              index: i,
                            ),
                          ),
                      ],
                    );
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

class _SkillLaneCard extends StatefulWidget {
  const _SkillLaneCard({
    required this.lane,
    required this.skills,
    required this.index,
  });

  final _SkillLane lane;
  final List<Skill> skills;
  final int index;

  @override
  State<_SkillLaneCard> createState() => _SkillLaneCardState();
}

class _SkillLaneCardState extends State<_SkillLaneCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final lane = widget.lane;
    final accent = lane.accent;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 380 + widget.index * 70),
      curve: Curves.easeOutCubic,
      builder: (context, t, child) {
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, 14 * (1 - t)),
            child: child,
          ),
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transformAlignment: Alignment.center,
          transform: Matrix4.translationValues(0, _hovered ? -5 : 0, 0),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                accent.withValues(alpha: _hovered ? 0.16 : 0.07),
                AppTheme.surface,
              ],
            ),
            border: Border.all(
              color: accent.withValues(alpha: _hovered ? 0.55 : 0.22),
            ),
            boxShadow: [
              BoxShadow(
                color: accent.withValues(alpha: _hovered ? 0.18 : 0),
                blurRadius: 22,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: accent.withValues(alpha: 0.35)),
                    ),
                    child: Icon(lane.icon, color: accent, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      lane.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppTheme.textPrimary,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                lane.blurb,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.45,
                    ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.skills
                    .map(
                      (skill) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.background.withValues(alpha: 0.55),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: accent.withValues(alpha: 0.28),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: accent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              skill.name,
                              style: const TextStyle(
                                color: AppTheme.textPrimary,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
