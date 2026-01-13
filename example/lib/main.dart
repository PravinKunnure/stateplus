import 'package:flutter/material.dart';
import 'package:stateplus/stateplus.dart';

/// =======================================================
/// APP STATE
/// =======================================================

final counter = Signal<int>(0);
final doubleCounter = Computed(() => counter.value * 2);
final router = RouteState();

/// =======================================================
/// APP ENTRY
/// =======================================================

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatePlus Demo',
      home: StateRouter(
        router: router,
        routes: {
          '/': () => const HomePage(),
          '/details': () => const DetailsPage(),
        },
      ),
    );
  }
}

/// =======================================================
/// PAGES
/// =======================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: StateWidget(
          builder: () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Counter: ${counter.value}',
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                'Double: ${doubleCounter.value}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => counter.value++,
                child: const Text('Increment'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => router.go('/details'),
                child: const Text('Go to Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => router.go('/'),
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}
