import 'package:flutter/material.dart';

void main() => runApp(const MyTextApp());

class MyTextApp extends StatelessWidget {
  const MyTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Text Widget Styles'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Hello, Flutter! 🚀',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Beautiful & Fast UI ❤️',
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Custom Fonts & Styling 🎨',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black26,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
