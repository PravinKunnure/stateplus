# StatePlus ⚡

[![Pub Version](https://img.shields.io/pub/v/stateplus)](https://pub.dev/packages/stateplus) | [![License: MIT](https://img.shields.io/badge/license-MIT-green)](https://opensource.org/licenses/MIT)

A **minimal, high-performance reactive state management and navigation solution** for Flutter.

StatePlus is designed to eliminate boilerplate, avoid unnecessary rebuilds, and unify **state + navigation** into a single reactive system.

---

## ✨ Features

- ⚡ Fine-grained reactivity (only rebuilds what changes)
- 🧠 Simple primitives: `Signal`, `Computed`, `Effect`
- 🧱 Minimal rebuild widgets (`StateWidget`)
- 🧭 State-driven navigation (no Navigator push/pop)
- ❌ No BuildContext dependency for state
- ❌ No code generation
- 🚀 Extremely fast & predictable

---

## 📦 Installation

```yaml
dependencies:
  stateplus: ^0.1.0-dev.1

```

### 🧠 Core Concepts:
| Concept     | Description                           |
| ----------- | ------------------------------------- |
| Signal      | Reactive value holder                 |
| Computed    | Derived reactive value                |
| StateWidget | Widget that rebuilds only when needed |
| RouteState  | Navigation as state                   |


### 🧪 Basic Example:

    final counter = Signal(0);
    final doubleCounter = Computed(() => counter.value * 2);

    StateWidget(
        builder: () => Text('Count: ${counter.value}'),
    )


### 🧭 Navigation as State:

    final router = RouteState();
    router.go('/details');

    StateRouter(
    router: router,
    routes: {
        '/': () => HomePage(),
        '/details': () => DetailsPage(),
     },
    );

## No Navigator.push, no BuildContext.

### 🔥 Why StatePlus?
| Library  | Problem              |
| -------- | -------------------- |
| Bloc     | Too much boilerplate |
| Provider | Context-heavy        |
| Riverpod | Over-abstracted      |
| Redux    | Verbose & rigid      |

- StatePlus = minimal + predictable + fast


### 🚧 Roadmap:
- Async signals
- Error handling
- Scoped state trees
- URL sync for Flutter Web
- DevTools integration


### 🤝 Contributing
- PRs are welcome.
- Please open an issue before major changes.