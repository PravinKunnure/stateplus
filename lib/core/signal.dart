import 'package:stateplus/core/observer.dart';

typedef Listener = void Function();

class Signal<T> {
  Signal(this._value);

  T _value;
  final Set<Listener> _listeners = {};

  T get value {
    Observer.current?.track(this);
    return _value;
  }

  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    for (final l in _listeners) {
      l();
    }
  }

  void subscribe(Listener l) => _listeners.add(l);
  void unsubscribe(Listener l) => _listeners.remove(l);
}
