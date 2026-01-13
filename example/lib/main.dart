import 'package:flutter/material.dart';
import 'package:stateplus/stateplus.dart';

/// =======================================================
/// APP STATE
/// =======================================================

// Reactive signal
final counter = Signal<int>(0);

// Derived/computed value
final doubleCounter = Computed(() => counter.value * 2);

// Router state (state-driven navigation)
final router = RouteState();

// Async signal example
final asyncMessage = Signal<String>("Loading...");

// Boolean signal to toggle visibility
final showMessage = Signal<bool>(true);

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

  // Simulate async update
  void _loadMessage() async {
    asyncMessage.value = "Loading...";
    await Future.delayed(const Duration(seconds: 2));
    asyncMessage.value = "Hello from StatePlus!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StatePlus Demo')),
      body: Center(
        child: StateWidget(
          builder: () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// --- SIGNAL ---
              Text(
                'Counter: ${counter.value}',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 8),

              /// --- COMPUTED ---
              Text(
                'Double: ${doubleCounter.value}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),

              /// --- SIGNAL UPDATE BUTTON ---
              ElevatedButton(
                onPressed: () => counter.value++,
                child: const Text('Increment Counter'),
              ),
              const SizedBox(height: 16),

              /// --- ASYNC SIGNAL DEMO ---
              ElevatedButton(
                onPressed: _loadMessage,
                child: const Text('Load Async Message'),
              ),
              const SizedBox(height: 8),

              /// --- CONDITIONAL SIGNAL ---
              if (showMessage.value)
                Text(
                  asyncMessage.value,
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              const SizedBox(height: 8),

              /// --- TOGGLE SIGNAL DEMO ---
              ElevatedButton(
                onPressed: () => showMessage.value = !showMessage.value,
                child: const Text('Toggle Message Visibility'),
              ),
              const SizedBox(height: 16),

              /// --- NAVIGATION (STATE DRIVEN) ---
              ElevatedButton(
                onPressed: () => router.go('/details'),
                child: const Text('Go to Details Page'),
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
      appBar: AppBar(title: const Text('Details Page')),
      body: Center(
        child: StateWidget(
          builder: () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Show signals here too to demonstrate reactive updates
              Text(
                'Counter: ${counter.value}',
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                'Double: ${doubleCounter.value}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),

              /// Navigation back
              ElevatedButton(
                onPressed: () => router.go('/'),
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
