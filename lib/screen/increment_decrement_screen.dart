import 'package:example_demo_t/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncrementDecrementScreen extends StatefulWidget {
  const IncrementDecrementScreen({super.key});

  @override
  State<IncrementDecrementScreen> createState() =>
      _IncrementDecrementScreenState();
}

class _IncrementDecrementScreenState extends State<IncrementDecrementScreen> {
  @override
  Widget build(BuildContext context) {
    final counteProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CounterProvider>(
              builder: (context, value, child) {
                return Text(
                  '${counteProvider.count}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counteProvider.increment();
              });
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counteProvider.decrement();
              });
            },
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counteProvider.reset();
              });
            },
            tooltip: 'Reset',
            child: Icon(Icons.restart_alt),
          ),
        ],
      ),
    );
  }
}
