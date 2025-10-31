import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/transformers.dart';

class DebouncerHelper {
  DebouncerHelper({required this.duration});
  final Duration duration;
  void Function()? _action;
  Timer? _timer;

  void call(void Function() action) {
    _action = action;
    _timer?.cancel();
    _timer = Timer(duration, _execute);
  }

  void _execute() {
    if (_action != null) {
      _action!();
    }
    _timer = null;
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }

  static EventTransformer<MapEvent> eventDebounce<MapEvent>({
    Duration duration = const Duration(milliseconds: 350),
  }) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
