import 'dart:ui';

import 'package:stateplus/core/signal.dart';

class Observer {
  static Observer? current;

  final Set<Signal> _signals = {};
  final VoidCallback onUpdate;

  Observer(this.onUpdate);

  void track(Signal s) {
    _signals.add(s);
    s.subscribe(onUpdate);
  }

  void dispose() {
    for (final s in _signals) {
      s.unsubscribe(onUpdate);
    }
  }
}
