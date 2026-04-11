## 1.0.2

### Bug Fixes
- **Fixed deprecated `withOpacity()` warnings** - Replaced all `withOpacity()` calls with `.withValues(alpha: ...)` for better precision and future compatibility
- **Fixed LinearLoader width calculation** - Replaced fixed width multiplication with `FractionallySizedBox` for proper `double.infinity` handling
- **Fixed test suite** - Updated from outdated Calculator tests to comprehensive widget tests for all 11 loaders

### Improvements
- **Added comprehensive dartdoc comments** - All public API elements (loaders, classes, methods) now have proper documentation with usage examples
  - Library header documentation
  - All 11 loader class documentation
  - Skeleton item class documentation
  - Usage examples for each loader
- **Enhanced code quality** - Improved code formatting and structure across all loaders
- **Better IDE support** - Documentation comments provide better autocomplete and hover information in IDEs

### Dependencies
- No breaking changes
- No new dependencies added
- Maintains zero external dependencies (Flutter only)

### Testing
- All 13 widget tests passing ✅
- Improved test coverage for all loader types
- Tested on Flutter 3.41.6, Dart 3.11.4

## 1.0.0

- Initial release on pub.dev
- 11 fully customizable loaders:
  - **CircleLoader** - Classic rotating circle spinner with customizable border
  - **DotLoader** - Animated scaling dots with configurable count and spacing
  - **PulseLoader** - Expanding circular rings with customizable pulse count
  - **WaveLoader** - Wave motion animation with adjustable wave count
  - **SpinningLoader** - Smooth rotating arc with custom arc length
  - **BounceLoader** - Bouncing ball animation with customizable bounce height
  - **LogoLoader** - Display brand logo with animated spinner ring
  - **ImageLoader** - Circular image with animated gradient border
  - **LinearLoader** - Progress bar with optional percentage display
  - **ShimmerLoader** - Skeleton shimmer effect for content placeholders
  - **SkeletonLoader** - Complex multi-item skeleton loading indicators
- Complete customization support:
  - Colors and gradients
  - Sizes and dimensions
  - Animation durations
  - Animation curves (linear, easeIn/Out, bounce, elastic, etc.)
  - Advanced parameters per loader
- Production-ready with smooth 60 FPS animations
- Zero external dependencies (Flutter only)
- Comprehensive documentation and usage examples
- Complete test coverage with 13+ passing tests
- Full-featured example app with all loaders demonstrated
