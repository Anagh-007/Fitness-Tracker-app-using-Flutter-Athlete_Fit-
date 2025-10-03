import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/formatters.dart';
import '../../domain/activity.dart';
import '../controllers/activity_controller.dart';
import '../widgets/animated_athlete.dart';
import '../widgets/metric_card.dart';
import '../../../../theme.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(selectedActivityProvider);
    final metrics = ref.watch(metricsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ATHLETE FIT'),
        flexibleSpace: const DecoratedBox(
          decoration: BoxDecoration(gradient: appGradient),
        ),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: RefreshIndicator(
        onRefresh: () async => Future.delayed(const Duration(milliseconds: 500)),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              AnimatedAthlete(activity: activity),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: MetricCard(
                      title: 'Steps',
                      value: kFormatInt(metrics.steps),
                      icon: Icons.directions_walk,
                    ),
                  ),
                  Expanded(
                    child: MetricCard(
                      title: 'Calories',
                      value: metrics.calories.toStringAsFixed(0),
                      suffix: ' kcal',
                      icon: Icons.local_fire_department,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: MetricCard(
                      title: 'Heart Rate',
                      value: metrics.heartRate.toString(),
                      suffix: ' bpm',
                      icon: Icons.favorite,
                    ),
                  ),
                  Expanded(
                    child: MetricCard(
                      title: 'Activity',
                      value: activity.label,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Pick your activity',
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ActivityType.values.map((a) {
                  final isSel = a == activity;
                  return ChoiceChip(
                    label: Text(a.label),
                    selected: isSel,
                    onSelected: (_) =>
                        ref.read(selectedActivityProvider.notifier).state = a,
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              const _WeeklyChart(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeeklyChart extends StatelessWidget {
  const _WeeklyChart();

  @override
  Widget build(BuildContext context) {
    final bars = [3500, 6800, 4200, 9100, 12000, 8000, 6000];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Weekly Steps', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (v, _) {
                          const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(days[v.toInt() % 7]),
                          );
                        },
                      ),
                    ),
                  ),
                  barGroups: [
                    for (int i = 0; i < bars.length; i++)
                      BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: bars[i].toDouble(),
                            width: 16,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6C5CE7), Color(0xFF00D4FF)],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
