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
