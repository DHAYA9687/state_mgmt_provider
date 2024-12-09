import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providerscreen.dart';

class Secondscrren extends StatefulWidget {
  const Secondscrren({super.key});

  @override
  State<Secondscrren> createState() => _SecondscrrenState();
}

class _SecondscrrenState extends State<Secondscrren> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Providerscreen>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<Providerscreen>(builder: (context, prodvalue, child) {
              return Text("Count : ${provider.count}");
            }),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  provider.decrement();
                },
                child: const Text("Decrement")),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Home")),
          ],
        ),
      ),
    );
  }
}
