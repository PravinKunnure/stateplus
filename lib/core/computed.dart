import 'package:stateplus/core/observer.dart';

class Computed<T> {
  late T _value;
  late Observer _observer;

  Computed(T Function() compute) {
    _observer = Observer(() {
      _value = compute();
    });

    Observer.current = _observer;
    _value = compute();
    Observer.current = null;
  }

  T get value => _value;
}
