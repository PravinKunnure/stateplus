import 'package:stateplus/core/observer.dart';

/// Runs a side-effect whenever any reactive dependencies used inside [fn] change.
///
/// The [effect] function tracks all reactive values accessed during the
/// execution of [fn]. When any of these dependencies update, [fn] is re-run automatically.
///
/// Example:
/// ```dart
/// final count = Reactive<int>(0);
///
/// effect(() {
///   print('Count changed: ${count.value}');
/// });
/// count.value = 1; // Triggers the effect and prints "Count changed: 1"
/// ```
void effect(void Function() fn) {
  late Observer observer;

  // Create an observer that disposes itself and re-runs the effect when triggered
  observer = Observer(() {
    observer.dispose();
    effect(fn);
  });

  // Track dependencies during the initial execution
  Observer.current = observer;
  fn();
  Observer.current = null;
}
