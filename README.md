# pressable_button

[![Pub.dev](https://img.shields.io/pub/v/pressable_button.svg)](https://pub.dev/packages/pressable_button)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.35.0+-blue.svg)](https://flutter.dev)

A customizable 3D animated pressable button for Flutter with smooth depth and glow effects.

<video src='https://github.com/user-attachments/assets/5f45d0a8-e6f7-426f-a955-b49aa6578c62'></video>

## Features

✨ **Smooth Press Animation** - Fluid 3D pressing effect with customizable duration

🎨 **Highly Customizable** - Adjust colors, size, depth, and border radius

💡 **Glow & Shadow Effects** - Professional-looking depth and lighting effects

⚡ **Lightweight** - Zero external dependencies, minimal performance overhead

🎯 **Easy to Use** - Simple API with sensible defaults

♿ **Flexible Child Widget** - Use any widget inside the button (Text, Icon, Image, etc.)

---

## Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Usage](#usage)
- [API Reference](#api-reference)
- [Advanced Examples](#advanced-examples)
- [Performance](#performance)
- [Contributing](#contributing)
- [License](#license)

---

## Installation

Add `pressable_button` to your `pubspec.yaml`:

```yaml
dependencies:
  pressable_button: ^0.0.3
```

Then run:

```bash
flutter pub get
```

### Version Requirements

- **Flutter**: ≥3.35.0
- **Dart**: ≥3.8.0

---

## Quick Start

The simplest way to use `PressableButton`:

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
        backgroundColor: const Color(0xFF101010),
        body: Center(
          child: PressableButton(
            onPressed: () {
              debugPrint('Button pressed!');
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

## Usage

### Basic Button

```dart
PressableButton(
  onPressed: () {},
  child: const Text('Press'),
)
```

### Customized Button

```dart
PressableButton(
  onPressed: () {
    print('Button pressed!');
  },
  child: const Text('Custom Button'),
  width: 220,
  height: 60,
  color: Colors.blue,
  shadowColor: Colors.blue.shade900,
  borderRadius: 16,
  pressDepth: 24,
  animationDuration: const Duration(milliseconds: 150),
)
```

### Button with Icon

```dart
PressableButton(
  onPressed: () {},
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(Icons.send, color: Colors.white),
      const SizedBox(width: 8),
      const Text('Send'),
    ],
  ),
  color: Colors.purple,
)
```

### Button in a Column

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    PressableButton(
      onPressed: () => _handleStart(),
      child: const Text('Start'),
      color: Colors.green,
    ),
    const SizedBox(height: 20),
    PressableButton(
      onPressed: () => _handleStop(),
      child: const Text('Stop'),
      color: Colors.red,
    ),
  ],
)
```

---

## API Reference

### PressableButton

A stateful widget that creates a 3D pressable button with animation.

#### Constructor

```dart
PressableButton({
  required VoidCallback onPressed,
  required Widget child,
  double width = 200,
  double height = 80,
  Color color = Colors.green,
  Color? shadowColor,
  double borderRadius = 25,
  double pressDepth = 32,
  Duration animationDuration = const Duration(milliseconds: 100),
})
```

#### Parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `onPressed` | `VoidCallback` | **required** | Callback function triggered when the button is pressed |
| `child` | `Widget` | **required** | The widget displayed inside the button |
| `width` | `double` | `200` | The width of the button |
| `height` | `double` | `80` | The height of the button |
| `color` | `Color` | `Colors.green` | The main color of the button |
| `shadowColor` | `Color?` | `null` | The shadow color beneath the button. If null, uses a semi-transparent version of `color` |
| `borderRadius` | `double` | `25` | The border radius of the button corners |
| `pressDepth` | `double` | `32` | The depth of the press animation. Higher values = more pronounced effect |
| `animationDuration` | `Duration` | `100ms` | The duration of the press animation |

---

## Advanced Examples

### Example 1: Submit Button with Loading State

```dart
class SubmitButton extends StatefulWidget {
  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool _isLoading = false;

  Future<void> _handleSubmit() async {
    setState(() => _isLoading = true);
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      debugPrint('Submitted!');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PressableButton(
      onPressed: _isLoading ? () {} : _handleSubmit,
      child: _isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            )
          : const Text('Submit'),
    );
  }
}
```

### Example 2: Game Button

```dart
PressableButton(
  onPressed: () => _playGame(),
  width: 180,
  height: 70,
  color: Colors.orange,
  shadowColor: Colors.deepOrange,
  borderRadius: 35,
  pressDepth: 20,
  animationDuration: const Duration(milliseconds: 120),
  child: const Text(
    'Play Game',
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
)
```

### Example 3: Rounded Button

```dart
PressableButton(
  onPressed: () {},
  width: 100,
  height: 100,
  borderRadius: 50, // Full circle
  color: Colors.pink,
  pressDepth: 16,
  child: const Icon(
    Icons.favorite,
    color: Colors.white,
    size: 40,
  ),
)
```

---

## Performance

The `PressableButton` is designed to be lightweight and performant:

- **No external dependencies** - Uses only Flutter framework
- **Single animation** - Uses `AnimatedPadding` for efficient animation
- **Minimal rebuilds** - Only rebuilds necessary widgets during animation
- **Small widget tree** - Simple `Stack` + `GestureDetector` implementation

### Animation Performance

The button uses `AnimatedPadding` with `Curves.easeInOut` for smooth animations. For 60fps displays, the default 100ms animation duration works well. Adjust `animationDuration` based on your design needs.

---

## Troubleshooting

### Button doesn't animate

Ensure `onPressed` is not null and the widget is properly initialized.

### Animation feels jerky

Try adjusting the `animationDuration` to a longer duration (e.g., 150ms or 200ms).

### Shadow not visible

Make sure the `shadowColor` has sufficient opacity. If not provided, it automatically uses a semi-transparent version of the main color.

### Child widget overflowing

Wrap your child widget with `SizedBox` or use `Expanded` to constrain its size.

---

## Example App

A complete example app is included in the `/example` folder.

Run the example locally:

```bash
cd example
flutter run
```

---

## Repository

- **GitHub**: [piedcipher/pressable_button](https://github.com/piedcipher/pressable_button)
- **Issue Tracker**: [GitHub Issues](https://github.com/piedcipher/pressable_button/issues)
- **Website**: [https://tirth.today](https://tirth.today)

---

### Development Setup

1. Clone the repository
2. Install dependencies: `flutter pub get`
3. Run tests: `flutter test`
4. Run the example: `cd example && flutter run`

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Made with ❤️ by [Tirth Patel](https://tirth.today)
