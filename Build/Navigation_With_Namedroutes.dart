import 'package:flutter/material.dart';

void main() {
  runApp(const RoutesDemo());
}

class RoutesDemo extends StatelessWidget {
  const RoutesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      onGenerateRoute: (settings) {
        if (settings.name == '/about') {
          return MaterialPageRoute(builder: (_) => const AboutPage());
        } else if (settings.name == '/contact') {
          return MaterialPageRoute(builder: (_) => const ContactPage());
        }
        return null;
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigate(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🏠 Home")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to left side
          children: [
            const Text(
              "Welcome to Home Page",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigate(context, const AboutPage()),
              child: const Text("Go to About Page"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _navigate(context, const ContactPage()),
              child: const Text("Go to Contact Page"),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ℹ️ About")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Back to Home"),
          ),
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("📞 Contact")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Back to Home"),
          ),
        ),
      ),
    );
  }
}

