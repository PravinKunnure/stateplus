import 'package:stateplus/core/observer.dart';

void effect(void Function() fn) {
  late Observer observer;

  observer = Observer(() {
    observer.dispose();
    effect(fn);
  });

  Observer.current = observer;
  fn();
  Observer.current = null;
}
