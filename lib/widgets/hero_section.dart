import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/url_helper.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  Alignment _gradientCenter = const Alignment(-0.5, -0.5);

  @override
  Widget build(BuildContext context) {
    final profile = PortfolioData.profile;
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          onHover: (event) {
            // Convert mouse local position to Alignment coordinates (-1.0 to 1.0)
            final dx = event.localPosition.dx;
            final dy = event.localPosition.dy;
            final alignX = (dx / constraints.maxWidth) * 2 - 1;
            final alignY = (dy / constraints.maxHeight) * 2 - 1;
            setState(() {
              _gradientCenter = Alignment(alignX, alignY);
            });
          },
          onExit: (_) {
            setState(() {
              _gradientCenter = const Alignment(-0.5, -0.5);
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: _gradientCenter,
                radius: 1.2,
                colors: const [
                  Color(0xFF164E63),
                  AppTheme.background,
                ],
                stops: const [0.0, 0.7],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 40 : 24,
                vertical: isWide ? 60 : 40,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
                  child: isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppTheme.primary.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: AppTheme.primary.withValues(alpha: 0.4),
                                      ),
                                    ),
                                    child: Text(
                                      'Available for Work',
                                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                            color: AppTheme.primary,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Text(
                                    'Hi, I\'m ${profile.name}',
                                    style: Theme.of(context).textTheme.displayLarge,
                                  ),
                                  const SizedBox(height: 8),
                                  ShaderMask(
                                    shaderCallback: (bounds) => const LinearGradient(
                                      colors: [AppTheme.primary, AppTheme.accent],
                                    ).createShader(bounds),
                                    child: Text(
                                      profile.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    profile.tagline,
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          fontSize: 18,
                                          color: AppTheme.textSecondary,
                                        ),
                                  ),
                                  const SizedBox(height: 32),
                                  Wrap(
                                    spacing: 12,
                                    runSpacing: 12,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () => openEmail(PortfolioData.contact.email),
                                        icon: const Icon(Icons.email_outlined, size: 18),
                                        label: const Text('Contact Me'),
                                      ),
                                      OutlinedButton.icon(
                                        onPressed: () => openUrl(PortfolioData.contact.linkedin),
                                        icon: const Icon(Icons.work_outline, size: 18),
                                        label: const Text('View LinkedIn'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  Wrap(
                                    spacing: 32,
                                    runSpacing: 16,
                                    children: [
                                      _StatBadge(
                                        value: '${profile.yearsFlutter + profile.yearsAndroid}+',
                                        label: 'Years Experience',
                                      ),
                                      const _StatBadge(
                                        value: '15+',
                                        label: 'Projects Built',
                                      ),
                                      const _StatBadge(
                                        value: '6',
                                        label: 'Platforms',
                                        subtitle: 'Android · iOS · Web · Windows · macOS · Linux',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 60),
                            _ProfileAvatar(isWide: isWide),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.primary.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppTheme.primary.withValues(alpha: 0.4),
                                ),
                              ),
                              child: Text(
                                'Available for Work',
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: AppTheme.primary,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Hi, I\'m ${profile.name}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            const SizedBox(height: 8),
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [AppTheme.primary, AppTheme.accent],
                              ).createShader(bounds),
                              child: Text(
                                profile.title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              profile.tagline,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 18,
                                    color: AppTheme.textSecondary,
                                  ),
                            ),
                            const SizedBox(height: 32),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              alignment: WrapAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () => openEmail(PortfolioData.contact.email),
                                  icon: const Icon(Icons.email_outlined, size: 18),
                                  label: const Text('Contact Me'),
                                ),
                                OutlinedButton.icon(
                                  onPressed: () => openUrl(PortfolioData.contact.linkedin),
                                  icon: const Icon(Icons.work_outline, size: 18),
                                  label: const Text('View LinkedIn'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            Wrap(
                              spacing: 32,
                              runSpacing: 16,
                              alignment: WrapAlignment.center,
                              children: [
                                _StatBadge(
                                  value: '${profile.yearsFlutter + profile.yearsAndroid}+',
                                  label: 'Years Experience',
                                ),
                                const _StatBadge(
                                  value: '15+',
                                  label: 'Projects Built',
                                ),
                                const _StatBadge(
                                  value: '6',
                                  label: 'Platforms',
                                  subtitle: 'Android · iOS · Web · Windows · macOS · Linux',
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            _ProfileAvatar(isWide: isWide),
                          ],
                        ),
              ),
            ),
          ),
        ),
      );
    },
  );
  }
}

class _StatBadge extends StatelessWidget {
  const _StatBadge({
    required this.value,
    required this.label,
    this.subtitle,
  });

  final String value;
  final String label;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppTheme.primary,
              ),
        ),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        if (subtitle != null)
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  color: AppTheme.textSecondary.withValues(alpha: 0.7),
                ),
          ),
      ],
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final profile = PortfolioData.profile;
    final size = isWide ? 320.0 : 220.0;
    final ringSize = size + 8;

    Widget photo;
    if (profile.profileImageAsset != null) {
      photo = ClipOval(
        child: Image.asset(
          profile.profileImageAsset!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          alignment: const Alignment(0, -0.45),
          errorBuilder: (_, __, ___) => _initialsAvatar(size),
        ),
      );
    } else if (profile.profileImageUrl != null) {
      photo = ClipOval(
        child: Image.network(
          profile.profileImageUrl!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          alignment: const Alignment(0, -0.45),
          errorBuilder: (_, __, ___) => _initialsAvatar(size),
        ),
      );
    } else {
      photo = _initialsAvatar(size);
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer glow ring
        Container(
          width: ringSize + 16,
          height: ringSize + 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                AppTheme.primary.withValues(alpha: 0.35),
                AppTheme.accent.withValues(alpha: 0.15),
                Colors.transparent,
              ],
            ),
          ),
        ),
        // Gradient border ring
        Container(
          width: ringSize,
          height: ringSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppTheme.primary, AppTheme.accent],
            ),
          ),
          child: Center(
            child: Container(
              width: size,
              height: size,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.background,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ClipOval(child: photo),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _initialsAvatar(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.surfaceLight,
      ),
      alignment: Alignment.center,
      child: Text(
        'QZ',
        style: TextStyle(
          fontSize: size * 0.28,
          fontWeight: FontWeight.bold,
          color: AppTheme.primary,
        ),
      ),
    );
  }
}
