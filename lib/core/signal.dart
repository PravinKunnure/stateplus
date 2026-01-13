import 'package:stateplus/core/observer.dart';

/// A listener callback function for [Signal] updates.
typedef Listener = void Function();

/// A reactive value that notifies observers when it changes.
///
/// A [Signal] wraps a value of type [T] and allows reactive components
/// such as [Computed] or [effect] to track and respond to its changes.
///
/// Example:
/// ```dart
/// final count = Signal<int>(0);
///
/// effect(() {
///   print('Count changed: ${count.value}');
/// });
///
/// count.value = 1; // Triggers the effect and prints "Count changed: 1"
/// ```
class Signal<T> {
  /// Creates a [Signal] with an initial [_value].
  Signal(this._value);

  T _value;

  final Set<Listener> _listeners = {};

  /// The current value of the signal.
  ///
  /// Accessing this getter registers the signal with the currently
  /// active [Observer], if any, so that dependent reactive computations
  /// will update automatically when this value changes.
  T get value {
    Observer.current?.track(this);
    return _value;
  }

  /// Updates the signal's value to [newValue].
  ///
  /// If the new value is different from the current value, all subscribed
  /// listeners are notified.
  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    for (final l in _listeners) {
      l();
    }
  }

  /// Subscribes a [Listener] to be called whenever the value changes.
  void subscribe(Listener l) => _listeners.add(l);

  /// Unsubscribes a previously subscribed [Listener].
  void unsubscribe(Listener l) => _listeners.remove(l);
}
