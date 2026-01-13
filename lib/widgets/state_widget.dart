import 'package:flutter/material.dart';
import 'package:stateplus/core/observer.dart';

class StateWidget extends StatefulWidget {
  final Widget Function() builder;
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
