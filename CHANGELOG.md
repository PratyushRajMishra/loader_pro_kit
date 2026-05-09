## 1.2.1

### Demo & README Improvements

* Added optimized demo GIF preview for GitHub and pub.dev
  * Added responsive README demo section
  * Improved package presentation and visual showcase
  * Optimized demo media rendering for better loading performance
  * Added centered demo preview with compact sizing

### New Features

* **Added LiquidFillLoader** – A highly customizable liquid fill loader with wave animation
  * Smooth animated wave motion with dual wave support
  * Gradient liquid fill with percentage display
  * Multiple shapes support:
    * Circle
    * Rounded rectangle
  * Glow effect and animated bubble support
  * Customizable wave height, speed, and frequency
  * Smooth painter-based rendering for better performance

### Demo App Improvements

* Added dedicated LiquidFillLoader showcase section
* Added multiple LiquidFillLoader variations:
  * Default
  * Gradient
  * Rounded
  * Bubble effect
  * Fast wave animation
* Improved demo organization and visual hierarchy

### Documentation Improvements

* Updated README with LiquidFillLoader examples
* Added advanced customization examples
* Improved package SEO keywords
* Updated total loader count to 14
* Enhanced package discoverability on pub.dev

### Performance & Quality

* Optimized wave animation rendering
* Improved animation smoothness using CustomPainter
* Reduced unnecessary rebuilds
* Maintained smooth 60 FPS animations

### Code Quality

* Improved loader architecture consistency
* Added reusable liquid shape clipping system
* Enhanced customization flexibility
* Maintained zero third-party runtime dependencies

### Dependencies

* No breaking changes
* No new dependencies added
* Fully backward compatible


## 1.2.0

### New Features

* **Added LiquidFillLoader** – A highly customizable liquid fill loader with wave animation
  * Smooth animated wave motion with dual wave support
  * Gradient liquid fill with percentage display
  * Multiple shapes: circle and rounded rectangle
  * Glow effect and bubble animation options
  * Customizable wave height, speed, and frequency

### Documentation Improvements

* **Comprehensive API Documentation** – Added dartdoc comments to all 13 loader widgets
  * All constructor parameters now documented with clear descriptions
  * Improves code readability and IDE autocomplete experience
  * Helps developers understand each parameter's purpose and default values
* **Public API Coverage** – Increased documented API elements from 18.9% to 20%+
  * Added parameter-level documentation for 100+ API elements
  * Better support for pub.dev scoring and code quality metrics

### Demo & Media

* **Professional Demo Video** – Added loader.webm showcasing all 13 loaders
  * High-quality animation demonstration
  * Integrated into README.md for GitHub and pub.dev
  * WebM format for optimal streaming

### Loaders with New Documentation

* BounceLoader
* CircleLoader
* DotLoader
* PulseLoader
* WaveLoader
* SpinningLoader
* OrbitLoader
* LogoLoader
* ImageLoader
* LinearLoader
* ShimmerLoader
* SkeletonLoader (including SkeletonLine and SkeletonCircle)
* LiquidFillLoader

## 1.1.0

### New Features

* **Added OrbitLoader** – A highly dynamic, modern orbit-style loader with rotating particles

  * Supports circular and elliptical motion
  * Customizable dot count, radius, and size
  * Smooth 60 FPS animation using `AnimatedBuilder`
* **Advanced animation effects**

  * Scale animation for depth effect
  * Opacity animation for smooth fading
  * Direction control (clockwise / reverse)

### Customization Enhancements

* Added **gradient support** for OrbitLoader
* Added **glow effect** for premium UI appearance
* Introduced **elliptical orbit mode** for unique motion styles
* Improved flexibility with animation curve and duration control

### Demo & Developer Experience

* Updated demo app to include OrbitLoader variations:

  * Default
  * Glow
  * Gradient
  * Elliptical
  * Compact
* Improved visual showcase for better developer understanding

### ⚡ Performance

* Optimized animation rendering using `AnimatedBuilder`
* Ensured efficient rebuilds and smooth performance across devices

### Code Quality

* Followed consistent animation architecture across loaders
* Improved modularity and readability of animation logic
* Maintained clean and scalable structure for future loaders

### Testing

* All existing widget tests passing
* Verified OrbitLoader behavior across different configurations
* No regressions introduced

### Dependencies

* No breaking changes
* No new dependencies added
* Fully backward compatible

---

## 1.0.3

### Bug Fixes

* Fixed animation not updating issue in `BounceLoader` and `WaveLoader`
* Ensured proper UI rebuilds using `AnimatedBuilder`

### Improvements

* Optimized animation performance by replacing manual rebuild patterns
* Standardized animation handling across all loaders
* Improved smoothness and visual consistency of animations

### Code Quality

* Refactored animation logic to follow Flutter best practices
* Reduced unnecessary widget rebuilds
* Improved maintainability and scalability

### Testing

* All widget tests passing
* Verified animation behavior across affected loaders
* No regressions introduced

### Dependencies

* No breaking changes
* No new dependencies added

## 1.0.2

### Bug Fixes

* Fixed deprecated `withOpacity()` warnings by replacing with `.withValues(alpha: ...)`
* Fixed `LinearLoader` width calculation using `FractionallySizedBox`
* Updated outdated test suite to proper widget-based tests

### Improvements

* Added comprehensive dartdoc documentation across all public APIs

  * Library-level documentation
  * Loader class documentation (all 11 loaders)
  * Usage examples for each loader
* Enhanced code formatting and structure
* Improved IDE autocomplete and developer experience

### Testing

* All 13 widget tests passing
* Improved test coverage for all loaders
* Tested on Flutter 3.41.6, Dart 3.11.4

### Dependencies

* No breaking changes
* No new dependencies added

## 1.0.1

### Improvements

* Minor internal improvements and stability enhancements
* Initial refinements based on early usage

### Code Quality

* Cleaned up code structure
* Improved consistency across loaders

### Testing

* Basic test fixes and improvements

### Dependencies

* No breaking changes

## 1.0.0

### Initial Release

* Introduced 11 fully customizable loaders:

  * CircleLoader
  * DotLoader
  * PulseLoader
  * WaveLoader
  * SpinningLoader
  * BounceLoader
  * LogoLoader
  * ImageLoader
  * LinearLoader
  * ShimmerLoader
  * SkeletonLoader

### Features

* Full customization support:

  * Colors and gradients
  * Sizes and dimensions
  * Animation durations
  * Animation curves
  * Advanced per-loader parameters
* Smooth 60 FPS animations
* Zero external dependencies (Flutter only)
* Comprehensive documentation and usage examples
* Complete test coverage
* Example app demonstrating all loaders
