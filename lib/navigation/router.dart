import 'package:flutter/material.dart';
import 'package:stateplus/stateplus.dart';

/// A widget that renders different UI based on the current route state.
///
/// [StateRouter] listens to a [RouteState] and displays the corresponding
/// widget from the provided [routes] map. If the current path does not
/// match any route, a default 404 page is displayed.
///
/// Example:
/// ```dart
/// final router = RouteState();
///
/// final routes = {
///   '/': () => HomePage(),
///   '/about': () => AboutPage(),
/// };
///
/// StateRouter(router: router, routes: routes);
/// ```
///
/// Whenever [router.go] is called to change the path, [StateRouter] will
/// automatically rebuild and show the corresponding widget.
class StateRouter extends StatelessWidget {
  /// The reactive router state that determines which route to display.
  final RouteState router;

  /// A mapping of route paths to their corresponding widget builders.
  final Map<String, Widget Function()> routes;

  /// Creates a [StateRouter] with the given [router] and [routes].
  const StateRouter({super.key, required this.router, required this.routes});

  @override
  Widget build(BuildContext context) {
    return StateWidget(
      builder: () {
        final path = router.path.value;
        return routes[path]?.call() ??
            const Scaffold(body: Center(child: Text('404')));
      },
    );
  }
}
