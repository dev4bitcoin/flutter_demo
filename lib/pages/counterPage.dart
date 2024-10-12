import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void incrementCounter() {
    // setstate rebuilds the widget
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // Specify the text direction
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You pushed the button this many times:"),
              Text(counter.toString(),
                  style: const TextStyle(fontSize: 24, color: Colors.red)),

              // Add a button to increment the counter
              ElevatedButton(
                onPressed: incrementCounter,
                child: Text("Increment"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
