# Loader Pro Kit

A professional Flutter loading animation package for modern mobile and web applications. `loader_pro_kit` provides customizable, high-performance loading widgets designed for production apps that need clean UI feedback, skeleton states, and branded loading experiences.

## 1. Why Loader Pro Kit

`loader_pro_kit` helps Flutter developers implement smooth loading indicators quickly, without external dependencies.

- Built for Flutter app performance and clean UI design
- Includes circular, linear, shimmer, skeleton, image, logo, and orbit loaders
- Fully customizable with color, size, duration, curves, gradients, and layout controls
- Suitable for login screens, API calls, feed placeholders, downloads, and branded splash states

## 2. Key Features

- 12 loader widgets in one package
- Zero third-party runtime dependencies
- 60 FPS optimized animation patterns
- Consistent and developer-friendly APIs
- Works across Android, iOS, web, desktop, and tablet layouts
- Easy drop-in usage with minimal setup

## 3. Loader List

### 3.1 Core Circular Loaders

1. `CircleLoader` - Classic rotating circle spinner
2. `DotLoader` - Animated scaling dots
3. `PulseLoader` - Expanding pulse rings
4. `WaveLoader` - Vertical wave animation
5. `SpinningLoader` - Arc-based rotating spinner
6. `BounceLoader` - Bouncing dots/balls
7. `OrbitLoader` - Orbiting dots with advanced motion effects

### 3.2 Advanced and Utility Loaders

1. `LogoLoader` - Branded logo loader with animated ring
2. `ImageLoader` - Circular image loader with animated border
3. `LinearLoader` - Horizontal progress loader with percentage option
4. `ShimmerLoader` - Skeleton shimmer placeholder block
5. `SkeletonLoader` - Multi-element skeleton UI placeholders

## 4. Installation

1. Add the package in `pubspec.yaml`:

```yaml
dependencies:
  loader_pro_kit: ^1.1.0
```

2. Install dependencies:

```bash
flutter pub get
```

## 5. Quick Start

```dart
import 'package:flutter/material.dart';
import 'package:loader_pro_kit/loader_pro_kit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircleLoader(
            color: Colors.blue,
            size: 56,
          ),
        ),
      ),
    );
  }
}
```

## 6. Usage Examples

### 6.1 API Loading State

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [
    DotLoader(color: Colors.blue, dotCount: 4, size: 12),
    SizedBox(width: 12),
    Text('Fetching data...'),
  ],
)
```

### 6.2 Download Progress UI

```dart
const LinearLoader(
  loaderColor: Colors.green,
  height: 8,
  showPercentage: true,
)
```

### 6.3 Content Placeholder Screen

```dart
SkeletonLoader(
  items: const [
    SkeletonLine(height: 20),
    SkeletonLine(height: 16),
    SkeletonLine(height: 16),
    SkeletonCircle(radius: 24),
  ],
)
```

### 6.4 Branded App Loading

```dart
LogoLoader(
  logo: Image.asset('assets/app_logo.png', width: 48),
  backgroundColor: const Color(0xFF0D47A1),
  size: 110,
)
```

### 6.5 OrbitLoader Example

```dart
const OrbitLoader(
  size: 72,
  dotCount: 6,
  dotSize: 10,
  color: Colors.blue,
  duration: Duration(milliseconds: 1400),
)
```

Use `OrbitLoader` when you want a modern circular motion indicator that feels more dynamic than a standard spinner.

## 7. Customization Options

Most loaders support the following configuration categories:

- Visual settings: `color`, `backgroundColor`, `gradientColors`, `borderWidth`
- Sizing settings: `size`, `height`, `width`, `spacing`, `borderRadius`
- Motion settings: `duration`, `animationCurve`, `arcLength`, `waveHeight`
- Component-specific settings: `dotCount`, `pulseCount`, `showPercentage`, `logoPadding`

### 7.1 OrbitLoader Advanced Example

```dart
OrbitLoader(
  size: 84,
  dotCount: 8,
  radius: 30,
  dotSize: 9,
  duration: const Duration(milliseconds: 1200),
  curve: Curves.easeInOut,
  reverse: false,
  glowEffect: true,
  animateScale: true,
  animateOpacity: true,
  elliptical: true,
  ellipseRatio: 0.65,
  useGradient: true,
  gradientColors: const [Colors.blue, Colors.cyan],
)
```

## 8. Performance and Quality

- Optimized for smooth rendering and low memory overhead
- Uses proper animation controller disposal patterns
- Tested with Flutter widget tests
- Designed for production UI and scalable design systems

## 9. Testing

Run package tests:

```bash
flutter test
```

## 10. Example App

Run the included example project:

```bash
cd example
flutter pub get
flutter run
```

## 11. Documentation

1. [Customization Guide](CUSTOMIZATION_GUIDE.md)
2. [Files Overview](FILES_OVERVIEW.md)
3. [Changelog](CHANGELOG.md)
4. [Package Summary](PACKAGE_SUMMARY.md)
5. [Quick Publish Guide](QUICK_PUBLISH.md)
6. [Publication Complete Guide](PUBLICATION_COMPLETE_GUIDE.md)

## 12. SEO Keywords

Flutter loader package, Flutter loading animation, Flutter progress indicator, Flutter shimmer loader, Flutter skeleton loader, Flutter UI loading widgets, Flutter spinner package, Flutter branded loader, Flutter animated loading kit.

## 13. License

This project is licensed under the [MIT License](LICENSE).

## 14. Repository

- Homepage: <https://github.com/PratyushRajMishra/loader_pro_kit>
- Issues: <https://github.com/PratyushRajMishra/loader_pro_kit/issues>
- Documentation: <https://github.com/PratyushRajMishra/loader_pro_kit>
