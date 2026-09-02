import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/url_helper.dart';
import 'section_header.dart';

/// GitHub dark contribution calendar (Primer) — same greens as github.com.
class _Gh {
  static const empty = Color(0xFF161B22);
  static const l1 = Color(0xFF0E4429);
  static const l2 = Color(0xFF006D32);
  static const l3 = Color(0xFF26A641);
  static const l4 = Color(0xFF39D353);
  static const cellBorder = Color(0xFF1B1F23);
  static const panel = Color(0xFF0D1117);
  static const panelBorder = Color(0xFF30363D);
  static const muted = Color(0xFF8B949E);
  static const text = Color(0xFFC9D1D9);
  static const tooltipBg = Color(0xFF1C2128);

  static const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
}

Color _levelColor(int level) {
  switch (math.max(0, math.min(level, 4))) {
    case 1:
      return _Gh.l1;
    case 2:
      return _Gh.l2;
    case 3:
      return _Gh.l3;
    case 4:
      return _Gh.l4;
    default:
      return _Gh.empty;
  }
}

class GithubActivitySection extends StatefulWidget {
  const GithubActivitySection({super.key});

  @override
  State<GithubActivitySection> createState() => _GithubActivitySectionState();
}

class _GithubActivitySectionState extends State<GithubActivitySection> {
  late Future<_GithubActivity> _future;

  @override
  void initState() {
    super.initState();
    _future = _loadActivity();
  }

  Future<_GithubActivity> _loadActivity() async {
    final username = PortfolioData.contact.githubUsername;
    final uri = Uri.parse(
      'https://github-contributions-api.jogruber.de/v4/$username',
    );
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Could not load GitHub contributions');
    }
    return _GithubActivity.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;
    final contact = PortfolioData.contact;

    return Container(
      width: double.infinity,
      color: AppTheme.background,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isWide ? 40 : 20,
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
                  label: 'Open Source',
                  title: 'GitHub Activity',
                  subtitle:
                      'Last 6 months of GitHub contributions — through this month, with the same greens and commit tooltips.',
                ),
                const SizedBox(height: 28),
                FutureBuilder<_GithubActivity>(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const _ChartSkeleton();
                    }
                    if (snapshot.hasError || !snapshot.hasData) {
                      return _ChartFallback(githubUrl: contact.github);
                    }
                    return _ContributionBoard(
                      activity: snapshot.data!,
                      githubUrl: contact.github,
                      username: contact.githubUsername,
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

class _ContributionBoard extends StatelessWidget {
  const _ContributionBoard({
    required this.activity,
    required this.githubUrl,
    required this.username,
  });

  final _GithubActivity activity;
  final String githubUrl;
  final String username;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 800;
    final windowTotal = activity.windowTotal;
    final windowLabel = _GithubActivity.windowLabel;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        isWide ? 20 : 14,
        isWide ? 18 : 14,
        isWide ? 20 : 14,
        isWide ? 16 : 12,
      ),
      decoration: BoxDecoration(
        color: _Gh.panel,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: _Gh.panelBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const FaIcon(FontAwesomeIcons.github, size: 18, color: _Gh.text),
              Text(
                '$windowTotal commits in the last 6 months',
                style: const TextStyle(
                  color: _Gh.text,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () => openUrl(githubUrl),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF58A6FF),
                  visualDensity: VisualDensity.compact,
                ),
                child: Text('@$username'),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '40+ projects on GitHub  ·  $windowLabel',
            style: const TextStyle(
              color: _Gh.muted,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),
          _ContributionHeatmap(days: activity.contributions),
          const SizedBox(height: 8),
          Row(
            children: [
              const Spacer(),
              const Text(
                'Less',
                style: TextStyle(color: _Gh.muted, fontSize: 11),
              ),
              const SizedBox(width: 6),
              for (var level = 0; level <= 4; level++) ...[
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _levelColor(level),
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: _Gh.cellBorder),
                  ),
                ),
                const SizedBox(width: 3),
              ],
              const Text(
                'More',
                style: TextStyle(color: _Gh.muted, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContributionHeatmap extends StatelessWidget {
  const _ContributionHeatmap({required this.days});

  final List<_ContributionDay> days;

  @override
  Widget build(BuildContext context) {
    if (days.isEmpty) return const SizedBox.shrink();

    final weeks = _weeksFrom(days);
    final width = MediaQuery.sizeOf(context).width;
    final cell = width < 420 ? 11.0 : (width < 700 ? 13.0 : 14.0);
    final gap = 4.0;
    const monthH = 20.0;
    final colW = cell + gap;
    final labels = _monthLabels(weeks);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: monthH, right: 6),
            child: Column(
              children: [
                _weekday('', cell, gap),
                _weekday('Mon', cell, gap),
                _weekday('', cell, gap),
                _weekday('Wed', cell, gap),
                _weekday('', cell, gap),
                _weekday('Fri', cell, gap),
                _weekday('', cell, gap),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: monthH,
                width: weeks.length * colW,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    for (var i = 0; i < weeks.length; i++)
                      if (labels[i] != null)
                        Positioned(
                          left: i * colW,
                          top: 0,
                          child: Text(
                            labels[i]!,
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.visible,
                            style: const TextStyle(
                              color: _Gh.muted,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                  ],
                ),
              ),
              Row(
                children: [
                  for (final week in weeks)
                    Padding(
                      padding: EdgeInsets.only(right: gap),
                      child: Column(
                        children: List.generate(7, (index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: gap),
                            child: _DayCell(day: week[index], size: cell),
                          );
                        }),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String?> _monthLabels(List<List<_ContributionDay?>> weeks) {
    final labels = List<String?>.filled(weeks.length, null);
    var lastMonth = -1;
    var lastIndex = -8;
    final currentMonth = _GithubActivity.gridEnd.month;

    for (var i = 0; i < weeks.length; i++) {
      final inWeek = weeks[i].whereType<_ContributionDay>().toList();
      if (inWeek.isEmpty) continue;
      final monthStart = inWeek.where((d) => d.date.day == 1);
      final month = monthStart.isNotEmpty
          ? monthStart.first.date.month
          : inWeek.first.date.month;
      final startsOnFirst = monthStart.isNotEmpty;
      if (month == lastMonth && !startsOnFirst) continue;
      if (!(i == 0 || startsOnFirst)) continue;
      final isCurrentMonth = month == currentMonth;
      if (!isCurrentMonth && i - lastIndex < 3) {
        lastMonth = month;
        continue;
      }
      labels[i] = _Gh.months[month - 1];
      lastMonth = month;
      lastIndex = i;
    }

    if (!labels.contains(_Gh.months[currentMonth - 1])) {
      for (var i = 0; i < weeks.length; i++) {
        final hasCurrent = weeks[i].whereType<_ContributionDay>().any(
              (d) => d.date.month == currentMonth,
            );
        if (hasCurrent) {
          labels[i] = _Gh.months[currentMonth - 1];
          break;
        }
      }
    }
    return labels;
  }

  List<List<_ContributionDay?>> _weeksFrom(List<_ContributionDay> allDays) {
    final start = _GithubActivity.windowStart;
    final last = _GithubActivity.gridEnd;
    final days = allDays.where((d) {
      final day = DateTime(d.date.year, d.date.month, d.date.day);
      return !day.isBefore(start) && !day.isAfter(last);
    }).toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    final byDate = {
      for (final day in days)
        DateTime(day.date.year, day.date.month, day.date.day): day,
    };

    var cursor = start;
    while (cursor.weekday != DateTime.sunday) {
      cursor = cursor.subtract(const Duration(days: 1));
    }

    final weeks = <List<_ContributionDay?>>[];
    while (!cursor.isAfter(last)) {
      final week = <_ContributionDay?>[];
      for (var i = 0; i < 7; i++) {
        final key = DateTime(cursor.year, cursor.month, cursor.day);
        if (key.isBefore(start) || key.isAfter(last)) {
          week.add(null);
        } else {
          week.add(
            byDate[key] ??
                _ContributionDay(date: key, count: 0, level: 0),
          );
        }
        cursor = cursor.add(const Duration(days: 1));
      }
      weeks.add(week);
    }
    return weeks;
  }

  Widget _weekday(String label, double cell, double gap) {
    return Padding(
      padding: EdgeInsets.only(bottom: gap),
      child: SizedBox(
        height: cell,
        width: 28,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: const TextStyle(fontSize: 9, color: _Gh.muted, height: 1),
          ),
        ),
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({required this.day, required this.size});

  final _ContributionDay? day;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (day == null) {
      return SizedBox(width: size, height: size);
    }

    final count = day!.count;
    final message = count == 0
        ? 'No contributions on ${_prettyDate(day!.date)}'
        : '$count contribution${count == 1 ? '' : 's'} on ${_prettyDate(day!.date)}';

    return Tooltip(
      message: message,
      waitDuration: Duration.zero,
      showDuration: const Duration(seconds: 4),
      preferBelow: false,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: _Gh.tooltipBg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: _Gh.panelBorder),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.3,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.basic,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: _levelColor(day!.level),
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: _Gh.cellBorder.withValues(alpha: 0.7)),
          ),
        ),
      ),
    );
  }

  String _prettyDate(DateTime date) {
    const full = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${full[date.month - 1]} ${date.day}, ${date.year}';
  }
}

class _ChartSkeleton extends StatelessWidget {
  const _ChartSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _Gh.panel,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: _Gh.panelBorder),
      ),
      child: const CircularProgressIndicator(color: _Gh.l3),
    );
  }
}

class _ChartFallback extends StatelessWidget {
  const _ChartFallback({required this.githubUrl});

  final String githubUrl;

  @override
  Widget build(BuildContext context) {
    final username = PortfolioData.contact.githubUsername;
    final chartUrl = 'https://ghchart.rshah.org/39d353/$username';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _Gh.panel,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: _Gh.panelBorder),
      ),
      child: Column(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => openUrl(githubUrl),
              child: Image.network(
                chartUrl,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => TextButton(
                  onPressed: () => openUrl(githubUrl),
                  child: const Text('View GitHub profile'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GithubActivity {
  const _GithubActivity({required this.totals, required this.contributions});

  final Map<String, int> totals;
  final List<_ContributionDay> contributions;

  static DateTime get windowStart {
    final now = DateTime.now();
    final month = now.month - 5;
    if (month > 0) return DateTime(now.year, month, 1);
    return DateTime(now.year - 1, month + 12, 1);
  }

  static DateTime get windowEnd {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  /// Full current month so September (and any in-progress month) has columns.
  static DateTime get gridEnd {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 1, 0);
  }

  static String get windowLabel {
    final start = windowStart;
    final end = gridEnd;
    return '${_Gh.months[start.month - 1]} ${start.year} – ${_Gh.months[end.month - 1]} ${end.year}';
  }

  int get windowTotal {
    final start = windowStart;
    final end = windowEnd;
    return contributions.where((d) {
      final day = DateTime(d.date.year, d.date.month, d.date.day);
      return !day.isBefore(start) && !day.isAfter(end);
    }).fold<int>(0, (sum, d) => sum + d.count);
  }

  factory _GithubActivity.fromJson(Map<String, dynamic> json) {
    final rawTotals = json['total'] as Map<String, dynamic>? ?? {};
    final totals = rawTotals.map(
      (key, value) => MapEntry(key, (value as num).toInt()),
    );
    final rawDays = json['contributions'] as List<dynamic>? ?? [];
    final contributions = rawDays.map((item) {
      final map = item as Map<String, dynamic>;
      return _ContributionDay(
        date: DateTime.parse(map['date'] as String),
        count: (map['count'] as num?)?.toInt() ?? 0,
        level: (map['level'] as num?)?.toInt() ?? 0,
      );
    }).toList();
    return _GithubActivity(totals: totals, contributions: contributions);
  }
}

class _ContributionDay {
  const _ContributionDay({
    required this.date,
    required this.count,
    required this.level,
  });

  final DateTime date;
  final int count;
  final int level;
}
