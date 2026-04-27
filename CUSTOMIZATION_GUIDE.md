# Loader Pro Kit – Complete Customization Guide

A powerful Flutter loader package with **12 fully customizable loaders**, including modern animations like Orbit, Shimmer, Skeleton, and more.

---

## 12. OrbitLoader (Premium Animation)

```dart
OrbitLoader(
  size: 70,                        // Overall size
  dotCount: 6,                     // Number of orbiting dots
  radius: 25,                      // Orbit radius
  dotSize: 8,                      // Size of each dot
  duration: Duration(milliseconds: 1200),
  curve: Curves.linear,

  reverse: false,                  // Reverse rotation
  glowEffect: true,                // Enable glow effect

  animateScale: true,              // Scale animation
  animateOpacity: true,            // Opacity animation

  elliptical: false,               // Enable elliptical orbit
  ellipseRatio: 0.6,               // Ellipse height ratio

  useGradient: true,               // Enable gradient colors
  gradientColors: [Colors.purple, Colors.blue],
  color: Colors.blue,              // Fallback color
)
```

---

## Core Loaders

### 1. CircleLoader

```dart
CircleLoader(
  color: Colors.blue,
  size: 50,
  duration: Duration(seconds: 2),
  borderWidth: 4,
  animationCurve: Curves.linear,
  backgroundColor: Colors.grey,
)
```

---

### 2. DotLoader

```dart
DotLoader(
  color: Colors.blue,
  size: 15,
  duration: Duration(milliseconds: 1400),
  dotCount: 4,
  spacing: 5,
  animationCurve: Curves.easeInOut,
  minScale: 0.4,
  maxScale: 1.0,
)
```

---

### 3. PulseLoader

```dart
PulseLoader(
  color: Colors.blue,
  size: 50,
  duration: Duration(milliseconds: 1200),
  pulseCount: 3,
  animationCurve: Curves.easeOut,
  maxRadius: 1.0,
  minOpacity: 0.0,
)
```

---

### 4. WaveLoader

```dart
WaveLoader(
  color: Colors.blue,
  size: 50,
  duration: Duration(milliseconds: 1200),
  waveCount: 3,
  waveHeight: 0.5,
  animationCurve: Curves.linear,
  borderRadius: 0.5,
)
```

---

### 5. SpinningLoader

```dart
SpinningLoader(
  color: Colors.blue,
  size: 50,
  duration: Duration(seconds: 2),
  borderWidth: 3,
  animationCurve: Curves.linear,
  backgroundColor: Colors.grey,
  arcLength: 3.14,
)
```

---

### 6. BounceLoader

```dart
BounceLoader(
  color: Colors.blue,
  size: 15,
  duration: Duration(milliseconds: 1400),
  dotCount: 3,
  animationCurve: Curves.easeInOut,
  bounceHeight: 1.5,
  opacityAnimation: true,
)
```

---

## Media-Based Loaders

### 7. LogoLoader

```dart
LogoLoader(
  logo: Icon(Icons.flutter_dash, size: 40),
  backgroundColor: Colors.blue,
  size: 80,
  duration: Duration(seconds: 2),
  arcThickness: 3,
  animationCurve: Curves.linear,
  ringColor: Colors.blue,
  logoPadding: 12,
)
```

---

### 8. ImageLoader

```dart
ImageLoader(
  image: NetworkImage('https://example.com/image.jpg'),
  loaderColor: Colors.blue,
  size: 80,
  duration: Duration(milliseconds: 1200),
  borderWidth: 2,
  animationCurve: Curves.linear,
  gradientColors: [Colors.blue, Colors.cyan],
)
```

---

## 📊 Linear & Skeleton Loaders

### 9. LinearLoader

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

---

### 10. ShimmerLoader

```dart
ShimmerLoader(
  width: double.infinity,
  height: 20,
  baseColor: Color(0xFFE0E0E0),
  highlightColor: Color(0xFFF5F5F5),
  duration: Duration(milliseconds: 1500),
  borderRadius: BorderRadius.all(Radius.circular(4)),
  shimmerWidth: 0.3,
  animationCurve: Curves.linear,
)
```

---

### 11. SkeletonLoader

```dart
SkeletonLoader(
  items: [
    SkeletonLine(
      width: double.infinity,
      height: 16,
      margin: EdgeInsets.only(bottom: 12),
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

---

## Common Customization Options

### Animation Curves

* `Curves.linear` – Constant speed
* `Curves.easeInOut` – Smooth animation
* `Curves.bounceIn` – Bouncy effect
* `Curves.elasticInOut` – Elastic motion

---

### Color & Gradient

* Use any Flutter `Color`
* Apply gradients using `gradientColors`
* Adjust opacity using `.withValues(alpha: ...)`

---

### Size & Layout

* Control overall size with `size`
* Fine-tune with `borderWidth`, `radius`, `spacing`
* Use `double.infinity` for responsive layouts

---

## Real-World Usage Examples

### Branded Loader

```dart
LogoLoader(
  logo: Image.asset('assets/logo.png', width: 30),
  backgroundColor: Color(0xFF6200EE),
  size: 100,
  arcThickness: 4,
)
```

---

### Styled Progress Bar

```dart
LinearLoader(
  width: 250,
  height: 8,
  showPercentage: true,
  loaderColor: Colors.green,
  gradientColors: [Colors.green, Colors.lightGreen],
)
```

---

### Skeleton UI

```dart
SkeletonLoader(
  items: [
    SkeletonCircle(radius: 35),
    SkeletonLine(height: 14),
    SkeletonLine(height: 14),
  ],
)
```

---

## Keywords (SEO Boost)

flutter loader, flutter loading animation, flutter spinner, flutter progress indicator, flutter skeleton loader, flutter shimmer, flutter UI loading widget

---

All loaders are optimized for **smooth 60 FPS animations**, **zero dependencies**, and **full customization**.

Build beautiful loading states effortlessly with Loader Pro Kit!
