import 'package:flutter/material.dart';
import 'package:stateplus/stateplus.dart';

class StateRouter extends StatelessWidget {
  final RouteState router;
  final Map<String, Widget Function()> routes;

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
