import 'package:flutter/material.dart';
import 'package:stateplus/core/observer.dart';

/// A widget that rebuilds itself whenever any reactive dependencies used
/// inside its [builder] change.
///
/// [StateWidget] tracks all [Signal]s or reactive values accessed during
/// the execution of [builder]. When any of these values change, the widget
/// automatically rebuilds.
///
/// Example:
/// ```dart
/// final count = Signal<int>(0);
///
/// StateWidget(
///   builder: () {
///     return Text('Count: ${count.value}');
///   },
/// );
///
/// count.value = 1; // The widget rebuilds and updates the displayed text
/// ```
class StateWidget extends StatefulWidget {
  /// The builder function that returns the widget tree.
  ///
  /// This function is re-executed whenever any reactive dependencies
  /// accessed during its execution change.
  final Widget Function() builder;

  /// Creates a [StateWidget] with the given [builder].
  const StateWidget({super.key, required this.builder});

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  late Observer observer;

  @override
  void initState() {
    super.initState();
    observer = Observer(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // Track reactive dependencies accessed inside builder
    Observer.current = observer;
    final result = widget.builder();
    Observer.current = null;
    return result;
  }

  @override
  void dispose() {
    observer.dispose();
    super.dispose();
  }
}
