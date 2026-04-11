# Loader Pro Kit 🚀

A comprehensive Flutter package with **11 beautiful, fully customizable loading animations**. Perfect for any app that needs modern, smooth, and professional loading indicators.

## 📦 What's Included

### Circular Loaders
- **CircleLoader** - Classic rotating circle spinner
- **DotLoader** - Animated scaling dots
- **PulseLoader** - Expanding circular pulses
- **WaveLoader** - Wave motion animation
- **SpinningLoader** - Smooth rotating arc
- **BounceLoader** - Bouncing ball animation

### Advanced Loaders
- **LogoLoader** - Display your brand logo while loading
- **ImageLoader** - Circular image with animated border
- **LinearLoader** - Progress bar with percentage display
- **ShimmerLoader** - Skeleton/placeholder shimmer effect
- **SkeletonLoader** - Complex content placeholder loading

## 🎥 Demo Video

**[▶️ Click to watch demo video](https://raw.githubusercontent.com/PratyushRajMishra/loader_pro_kit/main/docs/videos/demo.mp4)**

Or download and play the video file included in the repository at `docs/videos/demo.mp4`

### Loader Details

**CircleLoader**
```
A smooth rotating circle with customizable border and colors.
Perfect for simple loading states.
```

**DotLoader**
```
Animated scaling dots in a row.
Great for showing activity/progress.
```

**PulseLoader**
```
Expanding circular rings creating a pulse effect.
Ideal for smooth loading indicators.
```

**WaveLoader**
```
Wave motion with vertical movement.
Perfect for elegant loading states.
```

**SpinningLoader**
```
Rotating arc spinner with custom arc length.
Classic and versatile design.
```

**BounceLoader**
```
Bouncing balls with smooth easing animation.
Fun and engaging loading indicator.
```

**LogoLoader**
```
Your brand logo surrounded by an animated spinner ring.
Perfect for branded app experiences.
```

**ImageLoader**
```
Circular image with animated gradient border.
Ideal for profile picture or avatar loading.
```

**LinearLoader**
```
Horizontal progress bar with optional percentage text.
Great for download or upload indicators.
```

**ShimmerLoader**
```
Shimmer effect for content placeholders.
Perfect for skeleton loading states.
```

**SkeletonLoader**
```
Complex multi-item skeleton loading with shimmer.
Ideal for card or list item placeholders.
```

## ✨ Features

✅ **11 Unique Loader Designs** - Various animation styles  
✅ **Fully Customizable** - Colors, sizes, durations, animation curves  
✅ **Production Ready** - Smooth, performant animations  
✅ **Zero Dependencies** - Uses only Flutter/Dart  
✅ **Easy to Use** - Simple API, intuitive parameters  
✅ **Well Documented** - Complete customization guide included  
✅ **Responsive** - Works on all screen sizes  
✅ **Tested** - Comprehensive widget tests included  

## 📥 Installation

Add this line to your `pubspec.yaml`:

```yaml
dependencies:
  loader_pro_kit: ^1.0.2
```

Then run:
```bash
flutter pub get
```

## 🚀 Quick Start

### Basic Usage

```dart
import 'package:loader_pro_kit/loader_pro_kit.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircleLoader(
            color: Colors.blue,
            size: 60,
          ),
        ),
      ),
    );
  }
}
```

### All 11 Loaders

```dart
// 1. Circle Loader - Classic rotating spinner
CircleLoader(
  color: Colors.blue,
  size: 60,
  duration: Duration(seconds: 2),
)

// 2. Dot Loader - Animated scaling dots
DotLoader(
  color: Colors.green,
  size: 15,
  dotCount: 4,
)

// 3. Pulse Loader - Expanding rings
PulseLoader(
  color: Colors.orange,
  size: 60,
  pulseCount: 3,
)

// 4. Wave Loader - Wave motion
WaveLoader(
  color: Colors.pink,
  size: 40,
  waveCount: 3,
)

// 5. Spinning Loader - Smooth arc
SpinningLoader(
  color: Colors.purple,
  size: 60,
  arcLength: 3.14,
)

// 6. Bounce Loader - Bouncing balls
BounceLoader(
  color: Colors.red,
  size: 15,
  dotCount: 3,
  bounceHeight: 1.5,
)

// 7. Logo Loader - Branded loading
LogoLoader(
  logo: Icon(Icons.flutter_dash, size: 40),
  backgroundColor: Colors.blue,
  size: 80,
)

// 8. Image Loader - Image with border
ImageLoader(
  image: NetworkImage('https://example.com/image.jpg'),
  loaderColor: Colors.teal,
  size: 80,
)

// 9. Linear Loader - Progress bar
LinearLoader(
  loaderColor: Colors.blue,
  height: 8,
  showPercentage: true,
)

// 10. Shimmer Loader - Skeleton effect
ShimmerLoader(
  height: 20,
  width: double.infinity,
)

// 11. Skeleton Loader - Complex placeholders
SkeletonLoader(
  items: [
    SkeletonCircle(radius: 30),
    SkeletonLine(height: 16),
    SkeletonLine(height: 16),
  ],
)
```

## 🎨 Advanced Customization

### CircleLoader
```dart
CircleLoader(
  color: Colors.blue,              // Spinner color
  size: 50,                        // Loader size
  duration: Duration(seconds: 2),  // Animation duration
  borderWidth: 4,                  // Border thickness
  animationCurve: Curves.linear,   // Animation curve
  backgroundColor: Colors.grey,    // Background ring color
)
```

### DotLoader
```dart
DotLoader(
  color: Colors.blue,
  size: 15,
  dotCount: 4,                     // 1-10 dots
  spacing: 5,                      // Space between dots
  animationCurve: Curves.easeInOut,
  minScale: 0.4,                   // Scale range
  maxScale: 1.0,
)
```

### PulseLoader
```dart
PulseLoader(
  color: Colors.blue,
  size: 50,
  pulseCount: 3,                   // Number of rings
  animationCurve: Curves.easeOut,
  maxRadius: 1.0,                  // Max radius
  minOpacity: 0.0,                 // Min opacity
)
```

### WaveLoader
```dart
WaveLoader(
  color: Colors.blue,
  size: 50,
  waveCount: 3,                    // Wave elements
  waveHeight: 0.5,                 // Wave amplitude
  animationCurve: Curves.linear,
  borderRadius: 0.5,               // Border radius
)
```

### SpinningLoader
```dart
SpinningLoader(
  color: Colors.blue,
  size: 50,
  duration: Duration(seconds: 2),
  borderWidth: 3,
  animationCurve: Curves.linear,
  backgroundColor: Colors.grey,
  arcLength: 3.14,                 // Arc length (0-2π)
)
```

### BounceLoader
```dart
BounceLoader(
  color: Colors.blue,
  size: 15,
  dotCount: 3,                     // 1-5+ dots
  animationCurve: Curves.easeInOut,
  bounceHeight: 1.5,               // Bounce intensity
  opacityAnimation: true,          // Enable opacity
)
```

### LogoLoader
```dart
LogoLoader(
  logo: Icon(Icons.flutter_dash),
  backgroundColor: Colors.blue,
  size: 80,
  arcThickness: 3,                 // Arc width
  animationCurve: Curves.linear,
  ringColor: Colors.blue,
  logoPadding: 12,                 // Padding around logo
)
```

### ImageLoader
```dart
ImageLoader(
  image: NetworkImage('url'),
  loaderColor: Colors.blue,
  size: 80,
  duration: Duration(milliseconds: 1200),
  borderWidth: 2,
  animationCurve: Curves.linear,
  gradientColors: [Colors.blue, Colors.cyan],
)
```

### LinearLoader
```dart
LinearLoader(
  backgroundColor: Color(0xFFE0E0E0),
  loaderColor: Colors.blue,
  height: 6,
  borderRadius: 3,
  duration: Duration(seconds: 2),
  showPercentage: true,
  animationCurve: Curves.linear,
  gradientColors: [Colors.blue, Colors.purple],
  width: double.infinity,
  textStyle: TextStyle(color: Colors.blue),
)
```

### ShimmerLoader
```dart
ShimmerLoader(
  width: double.infinity,
  height: 20,
  baseColor: Color(0xFFE0E0E0),
  highlightColor: Color(0xFFF5F5F5),
  duration: Duration(milliseconds: 1500),
  borderRadius: BorderRadius.all(Radius.circular(4)),
  shimmerWidth: 0.3,               // Shimmer width
  animationCurve: Curves.linear,
)
```

### SkeletonLoader
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

## 🎯 Common Use Cases

### Loading Screen
```dart
Center(
  child: CircleLoader(
    color: Colors.blue,
    size: 80,
  ),
)
```

### Data Fetching Indicator
```dart
Row(
  children: [
    DotLoader(
      color: Colors.blue,
      dotCount: 4,
    ),
    SizedBox(width: 16),
    Text('Loading data...'),
  ],
)
```

### Download Progress
```dart
LinearLoader(
  loaderColor: Colors.green,
  showPercentage: true,
  height: 8,
)
```

### Content Placeholder
```dart
SkeletonLoader(
  items: [
    SkeletonLine(height: 20, margin: EdgeInsets.only(bottom: 16)),
    SkeletonLine(height: 16, margin: EdgeInsets.only(bottom: 12)),
    SkeletonLine(height: 16, margin: EdgeInsets.only(bottom: 12)),
    SkeletonLine(width: 200, height: 16),
  ],
)
```

### Branded Loading State
```dart
LogoLoader(
  logo: Image.asset('assets/app_logo.png', width: 50),
  backgroundColor: Color(0xFF6200EE),
  size: 120,
  arcThickness: 4,
)
```

## 🎬 Animation Curves

All loaders support custom animation curves:

```dart
Curves.linear        // Constant speed
Curves.easeIn        // Accelerating
Curves.easeOut       // Decelerating
Curves.easeInOut     // Accelerate then decelerate
Curves.bounceIn      // Bouncing effect
Curves.elasticInOut  // Elastic effect
Curves.fastOutSlowIn // Fast then slow
```

## 🧪 Testing

Run the included tests:

```bash
flutter test
```

Tests verify:
- ✅ All 11 loaders render correctly
- ✅ Custom properties are applied
- ✅ Animation controllers work properly
- ✅ Widgets dispose correctly
- ✅ No memory leaks

## 📱 Running the Example

```bash
cd example
flutter pub get
flutter run
```

The example app displays all 11 loaders with interactive demonstrations.

## 🎨 Theme Examples

### Pastel Theme
```dart
CircleLoader(
  color: Color(0xFFF8B5D4),      // Pastel pink
  backgroundColor: Color(0xFFF0E5FF),
  size: 60,
)
```

### Dark Mode
```dart
WaveLoader(
  color: Color(0xFF6200EE),
  size: 50,
)
```

### High Contrast
```dart
LinearLoader(
  loaderColor: Colors.black,
  backgroundColor: Colors.white,
  height: 10,
)
```

### Material Design 3
```dart
SpinningLoader(
  color: Color(0xFF6200EE),
  size: 60,
  borderWidth: 4,
)
```

## 📈 Performance

- ✅ Smooth 60 FPS animations
- ✅ Minimal memory footprint
- ✅ Efficient paint operations
- ✅ Proper disposal of controllers
- ✅ No frame drops even with multiple loaders

## 🐛 Troubleshooting

### Loader not animating?
- Ensure the widget is inside a `Scaffold` or similar container
- Check that `duration` is not set to `Duration.zero`

### Colors not showing?
- Verify the color is not transparent (`Colors.transparent`)
- Check the parent container's background

### Performance issues?
- Reduce the number of simultaneous loaders
- Increase duration for smoother animations

## 📝 Documentation

See [CUSTOMIZATION_GUIDE.md](CUSTOMIZATION_GUIDE.md) for complete API documentation with all parameters and options.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 🌟 Star Us

If you find this package useful, please give it a star on GitHub! ⭐

---

**Made with ❤️ by Pratyush Mishra**

**Happy Loading! 🚀**
