import 'dart:ui';
import 'package:stateplus/core/signal.dart';

/// Tracks reactive dependencies and triggers a callback when they change.
///
/// An [Observer] monitors all [Signal]s accessed during its tracking
/// period. When any of these signals update, the observer's [onUpdate]
/// callback is invoked.
///
/// This class is used internally by [Computed] and [effect] to manage
/// dependency tracking and automatic reactivity.
class Observer {
  /// The currently active observer used for dependency tracking.
  ///
  /// This is set while computing reactive values or running effects,
  /// so that signals can automatically register themselves.
  static Observer? current;

  final Set<Signal> _signals = {};

  /// Callback invoked whenever a tracked signal updates.
  final VoidCallback onUpdate;

  /// Creates an [Observer] with the given [onUpdate] callback.
  ///
  /// Example:
  /// ```dart
  /// final observer = Observer(() {
  ///   print('A dependency changed!');
  /// });
  /// ```
  Observer(this.onUpdate);

  /// Tracks the given [Signal] and subscribes to updates.
  ///
  /// When [s] changes, [onUpdate] will be called.
  void track(Signal s) {
    _signals.add(s);
    s.subscribe(onUpdate);
  }

  /// Disposes the observer by unsubscribing from all tracked signals.
  ///
  /// After calling [dispose], the observer will no longer be notified
  /// of any signal changes.
  void dispose() {
    for (final s in _signals) {
      s.unsubscribe(onUpdate);
    }
  }
}
