import 'package:stateplus/core/signal.dart';

class RouteState {
  final path = Signal<String>('/');

  void go(String newPath) {
    path.value = newPath;
  }
}
