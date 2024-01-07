import 'package:flutter/material.dart';
import 'package:my_flutter/providers/provider.dart';
import 'package:provider/provider.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Second Page")),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              const Text('Counter Value', style: TextStyle(fontSize: 20)),
              Text('${counterProvider.value}',
                  style: const TextStyle(fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () => counterProvider.increament(),
                      child: const Icon(Icons.add)),
                  ElevatedButton(
                      onPressed: () => counterProvider.decreament(),
                      child: const Icon(Icons.remove))
                ],
              )
            ])));
  }
}
