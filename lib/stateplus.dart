/// StatePlus: A lightweight reactive state management and navigation library for Flutter.
///
/// This library provides reactive primitives ([Signal], [Computed], [effect]) for building
/// reactive UIs, along with Flutter widgets ([StateWidget], [StateRouter]) and a simple
/// reactive routing solution ([RouteState]).
///
/// Example:
/// ```dart
/// import 'package:stateplus/stateplus.dart';
///
/// final count = Signal<int>(0);
///
/// StateWidget(
///   builder: () {
///     return Text('Count: ${count.value}');
///   },
/// );
///
/// count.value = 1; // Automatically rebuilds the widget
/// ```
library;

// Core reactive primitives
export 'core/signal.dart';
export 'core/computed.dart';
export 'core/effect.dart';

// Widgets for reactive Flutter UIs
export 'widgets/state_widget.dart';

// Navigation and routing
export 'navigation/router.dart';
export 'navigation/route_state.dart';
