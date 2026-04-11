import 'package:flutter/material.dart';
import 'package:loader_pro_kit/loader_pro_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loader Pro Kit Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const LoaderDemoPage(),
    );
  }
}

class LoaderDemoPage extends StatefulWidget {
  const LoaderDemoPage({Key? key}) : super(key: key);

  @override
  State<LoaderDemoPage> createState() => _LoaderDemoPageState();
}

class _LoaderDemoPageState extends State<LoaderDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loader Pro Kit'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity),

              // ===== CIRCULAR LOADERS =====
              const _SectionTitle(title: 'Circular Loaders'),

              _LoaderCard(
                title: 'Circle Loader',
                child: CircleLoader(
                  color: Colors.blueAccent,
                  size: 60,
                ),
              ),
              const SizedBox(height: 30),

              _LoaderCard(
                title: 'Dot Loader',
                child: DotLoader(
                  color: Colors.greenAccent,
                  dotCount: 4,
                ),
              ),
              const SizedBox(height: 30),

              _LoaderCard(
                title: 'Pulse Loader',
                child: PulseLoader(
                  color: Colors.orangeAccent,
                  size: 60,
                ),
              ),
              const SizedBox(height: 30),

              _LoaderCard(
                title: 'Wave Loader',
                child: WaveLoader(
                  color: Colors.pinkAccent,
                  size: 40,
                ),
              ),
              const SizedBox(height: 30),

              _LoaderCard(
                title: 'Spinning Loader',
                child: SpinningLoader(
                  color: Colors.purpleAccent,
                  size: 60,
                ),
              ),
              const SizedBox(height: 30),

              _LoaderCard(
                title: 'Bounce Loader',
                child: BounceLoader(
                  color: Colors.redAccent,
                  size: 12,
                ),
              ),
              const SizedBox(height: 50),

              // ===== LOGO & IMAGE LOADERS =====
              const _SectionTitle(title: 'Logo & Image Loaders'),

              _LoaderCard(
                title: 'Logo Loader',
                child: LogoLoader(
                  backgroundColor: Colors.blue,
                  size: 80,
                  logo: const Icon(
                    Icons.flutter_dash,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              _LoaderCard(
                title: 'Image Loader',
                child: ImageLoader(
                  loaderColor: Colors.teal,
                  size: 80,
                  image: const NetworkImage(
                    'https://via.placeholder.com/150',
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // ===== LINEAR LOADERS =====
              const _SectionTitle(title: 'Linear Loaders'),

              _LoaderCard(
                title: 'Linear Loader (Basic)',
                child: LinearLoader(
                  loaderColor: Colors.blue,
                  height: 8,
                ),
              ),
              const SizedBox(height: 30),

              _LoaderCard(
                title: 'Linear Loader (With %)',
                child: LinearLoader(
                  loaderColor: Colors.green,
                  height: 8,
                  showPercentage: true,
                ),
              ),
              const SizedBox(height: 30),

              _LoaderCard(
                title: 'Shimmer Loader',
                child: Column(
                  children: [
                    ShimmerLoader(height: 16),
                    const SizedBox(height: 12),
                    ShimmerLoader(height: 16),
                    const SizedBox(height: 12),
                    ShimmerLoader(
                      width: 150,
                      height: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              _LoaderCard(
                title: 'Skeleton Loader',
                child: SkeletonLoader(
                  items: [
                    SkeletonCircle(radius: 30, margin: const EdgeInsets.only(bottom: 16)),
                    SkeletonLine(height: 16, margin: const EdgeInsets.only(bottom: 12)),
                    SkeletonLine(height: 16, margin: const EdgeInsets.only(bottom: 12)),
                    SkeletonLine(
                      height: 16,
                      width: 200,
                      margin: const EdgeInsets.only(bottom: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.blue[700],
        ),
      ),
    );
  }
}

class _LoaderCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _LoaderCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.grey[100]!, Colors.grey[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}
