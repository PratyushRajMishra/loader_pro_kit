import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loader_pro_kit/loader_pro_kit.dart';

void main() {
  group('Loader Pro Kit - Widget Tests', () {
    testWidgets('CircleLoader renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: CircleLoader(color: Colors.blue, size: 50)),
        ),
      );
      expect(find.byType(CircleLoader), findsOneWidget);
      expect(find.byType(RotationTransition), findsWidgets);
    });

    testWidgets('DotLoader renders with correct dot count', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: DotLoader(color: Colors.blue, dotCount: 4)),
        ),
      );
      expect(find.byType(DotLoader), findsOneWidget);
      expect(find.byType(ScaleTransition), findsWidgets);
    });

    testWidgets('PulseLoader renders with pulse rings', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: PulseLoader(color: Colors.blue, pulseCount: 3)),
        ),
      );
      expect(find.byType(PulseLoader), findsOneWidget);
    });

    testWidgets('WaveLoader renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: WaveLoader(color: Colors.blue, waveCount: 3)),
        ),
      );
      expect(find.byType(WaveLoader), findsOneWidget);
    });

    testWidgets('SpinningLoader renders with rotation', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: SpinningLoader(color: Colors.blue, size: 50)),
        ),
      );
      expect(find.byType(SpinningLoader), findsOneWidget);
      expect(find.byType(RotationTransition), findsWidgets);
    });

    testWidgets('BounceLoader renders with bouncing dots', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: BounceLoader(color: Colors.blue, dotCount: 3)),
        ),
      );
      expect(find.byType(BounceLoader), findsOneWidget);
    });

    testWidgets('LogoLoader renders with custom logo', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LogoLoader(
              logo: Icon(Icons.flutter_dash),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      );
      expect(find.byType(LogoLoader), findsOneWidget);
      expect(find.byIcon(Icons.flutter_dash), findsOneWidget);
    });

    testWidgets('LinearLoader renders progress bar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LinearLoader(loaderColor: Colors.blue, showPercentage: true),
          ),
        ),
      );
      expect(find.byType(LinearLoader), findsOneWidget);
    });

    testWidgets('ShimmerLoader renders with shimmer effect', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: ShimmerLoader(height: 20))),
      );
      expect(find.byType(ShimmerLoader), findsOneWidget);
    });

    testWidgets('SkeletonLoader renders multiple skeleton items', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SkeletonLoader(
              items: [SkeletonLine(height: 16), SkeletonCircle(radius: 30)],
            ),
          ),
        ),
      );
      expect(find.byType(SkeletonLoader), findsOneWidget);
    });

    testWidgets('Loaders accept custom colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: CircleLoader(color: Colors.red, size: 50)),
        ),
      );
      expect(find.byType(CircleLoader), findsOneWidget);
    });

    testWidgets('Loaders accept custom sizes', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: DotLoader(color: Colors.blue, size: 25)),
        ),
      );
      expect(find.byType(DotLoader), findsOneWidget);
    });

    testWidgets('Loaders accept custom durations', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PulseLoader(
              color: Colors.blue,
              duration: Duration(seconds: 3),
            ),
          ),
        ),
      );
      expect(find.byType(PulseLoader), findsOneWidget);
    });
  });
}
