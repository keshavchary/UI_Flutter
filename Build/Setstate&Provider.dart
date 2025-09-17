import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalCounter()),
      ],
      child: const MyApp(),
    ),
  );
}

// Provider class for global counter
class GlobalCounter extends ChangeNotifier {
  int value = 0;

  void increase() {
    value++;
    notifyListeners();
  }

  void decrease() {
    value--;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int local = 0;

  void addLocal() => setState(() => local++);
  void removeLocal() => setState(() => local--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Provider + setState Example")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LocalCounterWidget(
              count: local,
              onAdd: addLocal,
              onRemove: removeLocal,
            ),
            const SizedBox(height: 50),
            const GlobalCounterWidget(),
          ],
        ),
      ),
    );
  }
}

/// Local counter widget
class LocalCounterWidget extends StatelessWidget {
  final int count;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const LocalCounterWidget({
    super.key,
    required this.count,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Local Counter (setState):",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text("$count", style: const TextStyle(fontSize: 36, color: Colors.blue)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: onRemove, child: const Icon(Icons.remove)),
            const SizedBox(width: 20),
            ElevatedButton(onPressed: onAdd, child: const Icon(Icons.add)),
          ],
        ),
      ],
    );
  }
}

/// Global counter widget (Consumer)
class GlobalCounterWidget extends StatelessWidget {
  const GlobalCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalCounter>(
      builder: (context, counter, _) {
        return Column(
          children: [
            const Text(
              "Global Counter (Provider):",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("${counter.value}",
                style: const TextStyle(fontSize: 36, color: Colors.green)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: counter.decrease,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: counter.increase,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
