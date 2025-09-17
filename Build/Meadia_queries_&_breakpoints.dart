import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveApp());
}

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatefulWidget {
  const ResponsiveHomePage({super.key});

  @override
  State<ResponsiveHomePage> createState() => _ResponsiveHomePageState();
}

class _ResponsiveHomePageState extends State<ResponsiveHomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final layout = ScreenHelper.getLayout(width);

    // Pick widget from a map
    final screens = {
      DeviceType.mobile: const MobileLayout(),
      DeviceType.tablet: const TabletLayout(),
      DeviceType.desktop: const DesktopLayout(),
    };

    return screens[layout] ?? const MobileLayout();
  }
}

/// Helper for screen type
enum DeviceType { mobile, tablet, desktop }

class ScreenHelper {
  static DeviceType getLayout(double width) {
    if (width < 600) return DeviceType.mobile;
    if (width < 1024) return DeviceType.tablet;
    return DeviceType.desktop;
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPage("Mobile Layout", "This is Mobile View", 18);
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPage("Tablet Layout", "This is Tablet View", 22);
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPage("Desktop Layout", "This is Desktop View", 26);
  }
}

/// Common page builder (to avoid repeating Scaffold everywhere)
Widget _buildPage(String title, String text, double size) {
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(child: Text(text, style: TextStyle(fontSize: size))),
  );
}
