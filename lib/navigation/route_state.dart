import 'package:stateplus/core/signal.dart';

/// Manages the current route path as a reactive signal.
///
/// The [RouteState] class allows navigation by updating the [path]
/// signal, which can be observed by reactive components to respond
/// to route changes.
///
/// Example:
/// ```dart
/// final route = RouteState();
///
/// effect(() {
///   print('Current path: ${route.path.value}');
/// });
///
/// route.go('/home'); // Triggers the effect and prints "Current path: /home"
/// ```
class RouteState {
  /// The current route path as a reactive [Signal].
  final path = Signal<String>('/');

  /// Navigates to a new route by updating the [path] signal.
  ///
  /// All reactive listeners observing [path] will be notified of the change.
  void go(String newPath) {
    path.value = newPath;
  }
}
