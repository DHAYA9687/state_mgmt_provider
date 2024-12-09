import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'secondscreen.dart';
import 'providerscreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Providerscreen(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Providerscreen(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late final provider;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Providerscreen>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter STATEFUL WIDGET'),
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
              return Text("Count : ${prodvalue.count}");
            }),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  provider.increment();
                },
                child: const Text("Increment")),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const Secondscrren()),
                  );
                },
                child: const Text("Next Screen")),
          ],
        ),
      ),
    );
  }
}
