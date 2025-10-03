import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 👇 Correct relative imports (exactly two ../)
import '../../domain/activity.dart';
import '../../data/mock_metrics_source.dart';

final selectedActivityProvider =
    StateProvider<ActivityType>((ref) => ActivityType.walking);

final metricsProvider =
    StateNotifierProvider<MetricsController, LiveMetrics>((ref) {
  final source = MockMetricsSource(); // swap with real health source later
  return MetricsController(source);
});

class MetricsController extends StateNotifier<LiveMetrics> {
  MetricsController(this._source) : super(LiveMetrics.zero()) {
    _timer = Timer.periodic(const Duration(milliseconds: 800), (_) {
      state = _source.nextSample();
    });
  }

  final MockMetricsSource _source;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
