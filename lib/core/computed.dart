import 'package:stateplus/core/observer.dart';

/// A reactive value that automatically recalculates whenever its dependencies change.
///
/// The [Computed] class tracks reactive dependencies accessed during the
/// computation function and updates its value when any of those dependencies change.
///
/// Example:
/// ```dart
/// final computedValue = Computed(() => someReactiveValue + 10);
/// print(computedValue.value);
/// ```
class Computed<T> {
  /// The current value of this computed property.
  /// Accessing this getter returns the latest computed value.
  T get value => _value;

  late T _value;
  late Observer _observer;

  /// Creates a [Computed] instance with the given computation function [compute].
  ///
  /// The [compute] function is executed immediately to initialize the value and
  /// is re-run automatically whenever any reactive dependencies it uses change.
  Computed(T Function() compute) {
    _observer = Observer(() {
      _value = compute();
    });

    // Register the current observer so dependencies can be tracked.
    Observer.current = _observer;
    _value = compute();
    Observer.current = null;
  }
}
