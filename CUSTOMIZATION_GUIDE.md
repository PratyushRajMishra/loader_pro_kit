# Loader Pro Kit - Complete Customization Guide

## 11 Fully Customizable Loaders

### 1. CircleLoader
```dart
CircleLoader(
  color: Colors.blue,              // Main spinner color
  size: 50,                         // Size of the loader
  duration: Duration(seconds: 2),  // Animation duration
  borderWidth: 4,                  // Border thickness
  animationCurve: Curves.linear,   // Animation curve
  backgroundColor: Colors.grey,    // Background ring color (optional)
)
```

### 2. DotLoader
```dart
DotLoader(
  color: Colors.blue,              // Dot color
  size: 15,                        // Individual dot size
  duration: Duration(milliseconds: 1400),
  dotCount: 4,                     // Number of dots
  spacing: 5,                      // Space between dots
  animationCurve: Curves.easeInOut,
  minScale: 0.4,                   // Minimum scale during animation
  maxScale: 1.0,                   // Maximum scale during animation
)
```

### 3. PulseLoader
```dart
PulseLoader(
  color: Colors.blue,
  size: 50,
  duration: Duration(milliseconds: 1200),
  pulseCount: 3,                   // Number of pulse rings
  animationCurve: Curves.easeOut,
  maxRadius: 1.0,                  // Maximum radius multiplier
  minOpacity: 0.0,                 // Minimum opacity of pulses
)
```

### 4. WaveLoader
```dart
WaveLoader(
  color: Colors.blue,
  size: 50,
  duration: Duration(milliseconds: 1200),
  waveCount: 3,                    // Number of wave elements
  waveHeight: 0.5,                 // Wave height multiplier
  animationCurve: Curves.linear,
  borderRadius: 0.5,               // Border radius of wave elements
)
```

### 5. SpinningLoader
```dart
SpinningLoader(
  color: Colors.blue,
  size: 50,
  duration: Duration(seconds: 2),
  borderWidth: 3,                  // Spinner stroke width
  animationCurve: Curves.linear,
  backgroundColor: Colors.grey,    // Background ring (optional)
  arcLength: 3.14,                 // Length of rotating arc (0-2π)
)
```

### 6. BounceLoader
```dart
BounceLoader(
  color: Colors.blue,
  size: 15,
  duration: Duration(milliseconds: 1400),
  dotCount: 3,                     // Number of bouncing dots
  animationCurve: Curves.easeInOut,
  bounceHeight: 1.5,               // Height of bounce
  opacityAnimation: true,          // Enable opacity animation
)
```

### 7. LogoLoader
```dart
LogoLoader(
  logo: Icon(Icons.flutter_dash, size: 40),  // Custom logo/widget
  backgroundColor: Colors.blue,
  size: 80,
  duration: Duration(seconds: 2),
  arcThickness: 3,                 // Thickness of rotating arc
  animationCurve: Curves.linear,
  ringColor: Colors.blue,          // Ring color (optional)
  logoPadding: 12,                 // Padding around logo
)
```

### 8. ImageLoader
```dart
ImageLoader(
  image: NetworkImage('https://example.com/image.jpg'),
  loaderColor: Colors.blue,
  size: 80,
  duration: Duration(milliseconds: 1200),
  borderWidth: 2,                  // Ring border width
  animationCurve: Curves.linear,
  gradientColors: [Colors.blue, Colors.cyan],  // Custom gradient
)
```

### 9. LinearLoader
```dart
LinearLoader(
  backgroundColor: Color(0xFFE0E0E0),
  loaderColor: Colors.blue,
  height: 6,
  borderRadius: 3,
  duration: Duration(seconds: 2),
  showPercentage: true,            // Show percentage text
  animationCurve: Curves.linear,
  gradientColors: [Colors.blue, Colors.purple],  // Custom gradient
  width: double.infinity,          // Width of progress bar
  textStyle: TextStyle(color: Colors.blue),  // Custom text style
)
```

### 10. ShimmerLoader
```dart
ShimmerLoader(
  width: double.infinity,
  height: 20,
  baseColor: Color(0xFFE0E0E0),
  highlightColor: Color(0xFFF5F5F5),
  duration: Duration(milliseconds: 1500),
  borderRadius: BorderRadius.all(Radius.circular(4)),
  shimmerWidth: 0.3,               // Width of shimmer effect
  animationCurve: Curves.linear,
)
```

### 11. SkeletonLoader
```dart
SkeletonLoader(
  items: [
    SkeletonLine(
      width: double.infinity,
      height: 16,
      margin: EdgeInsets.only(bottom: 12),
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    SkeletonCircle(
      radius: 40,
      margin: EdgeInsets.all(8),
    ),
  ],
  duration: Duration(milliseconds: 1500),
  baseColor: Color(0xFFE0E0E0),
  highlightColor: Color(0xFFF5F5F5),
  animationCurve: Curves.linear,
  shimmerWidth: 0.3,
)
```

## Common Customization Properties

### Animation Curves
- `Curves.linear` - Constant speed
- `Curves.easeIn` - Slow start, fast end
- `Curves.easeOut` - Fast start, slow end
- `Curves.easeInOut` - Slow start and end
- `Curves.bounceIn` - Bouncing effect
- `Curves.elasticInOut` - Elastic effect

### Color Customization
- Use any Flutter `Color` or `ColorTween`
- Apply gradients with `gradientColors` parameter
- Adjust opacity with `withOpacity()`

### Size & Dimension Control
- Adjust `size` parameter for overall scale
- Use `borderWidth`, `borderRadius` for fine-tuning
- Control spacing with dedicated parameters

## Usage Examples

### Custom Branded Loader with Logo
```dart
LogoLoader(
  logo: Image.asset('assets/logo.png', width: 30),
  backgroundColor: Color(0xFF6200EE),
  size: 100,
  arcThickness: 4,
  logoPadding: 15,
)
```

### Progress Bar with Custom Styling
```dart
LinearLoader(
  width: 250,
  height: 8,
  showPercentage: true,
  loaderColor: Colors.green,
  gradientColors: [Colors.green, Colors.lightGreen],
  borderRadius: 4,
  textStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.green[700],
  ),
)
```

### Content Placeholder Skeleton
```dart
SkeletonLoader(
  items: [
    SkeletonCircle(radius: 35, margin: EdgeInsets.only(bottom: 16)),
    SkeletonLine(height: 14, margin: EdgeInsets.only(bottom: 10)),
    SkeletonLine(height: 14, margin: EdgeInsets.only(bottom: 10)),
    SkeletonLine(width: 200, height: 14),
  ],
  baseColor: Colors.grey[300]!,
  highlightColor: Colors.grey[100]!,
  duration: Duration(milliseconds: 1200),
)
```

---

All loaders support complete customization for colors, sizes, durations, animations, and more! 🚀
