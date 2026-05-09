# pressable_button

A customizable 3D animated pressable button for Flutter with smooth depth and glow effects.

https://github.com/user-attachments/assets/5f45d0a8-e6f7-426f-a955-b49aa6578c62

## Features

- smooth press animation
- customizable width and height
- configurable press depth
- rounded corners
- glow and shadow effects
- lightweight and dependency-free
- supports any child widget

---

## Preview

```dart
PressableButton(
  onPressed: () {},
  child: const Text('Click Me'),
)
```

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  pressable_button: ^0.0.1
```

Run:

```bash
flutter pub get
```

---

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:pressable_button/pressable_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF101010),
        body: Center(
          child: PressableButton(
            onPressed: () {
              debugPrint('pressed');
            },
            child: const Text(
              'Click Me',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

---

## Customization

```dart
PressableButton(
  width: 220,
  height: 80,
  borderRadius: 24,
  pressDepth: 20,
  color: Colors.green,
  shadowColor: Colors.green.shade900,
  onPressed: () {},
  child: const Text('Press'),
)
```

---

## Parameters

| Parameter | Type | Default |
|---|---|---|
| `onPressed` | `VoidCallback` | required |
| `child` | `Widget` | required |
| `width` | `double` | `200` |
| `height` | `double` | `80` |
| `color` | `Color` | `Colors.green` |
| `shadowColor` | `Color?` | `null` |
| `borderRadius` | `double` | `25` |
| `pressDepth` | `double` | `32` |
| `animationDuration` | `Duration` | `100ms` |

---

## Example App

See the full example inside the `/example` folder.

Run locally:

```bash
cd example
flutter run
```

---

## Repository

- github: https://github.com/piedcipher/pressable_button
- website: https://tirth.today

---

## License

MIT
