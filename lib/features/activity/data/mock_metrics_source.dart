import 'dart:math';

class LiveMetrics {
  final int steps;
  final double calories;
  final int heartRate;

  const LiveMetrics({
    required this.steps,
    required this.calories,
    required this.heartRate,
  });

  factory LiveMetrics.zero() =>
      const LiveMetrics(steps: 0, calories: 0, heartRate: 72);
}

class MockMetricsSource {
  int _steps = 0;
  double _cal = 0;
  final _rng = Random();

  LiveMetrics nextSample() {
    final inc = _rng.nextInt(15); // 0..14
    _steps += inc;
    _cal += inc * 0.04; // ~0.04 kcal/step (very rough)
    final hr = 70 + _rng.nextInt(50); // 70..119
    return LiveMetrics(steps: _steps, calories: _cal, heartRate: hr);
  }
}
