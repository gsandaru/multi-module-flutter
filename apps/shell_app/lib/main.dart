import 'package:auto_route/auto_route.dart';
import 'package:core_services_poc/core_services_poc.dart';
import 'package:flutter/material.dart';
import 'package:shell_app/placeholder_page.dart';
import 'package:domain_a/domain_a.dart';
import 'package:domain_b/domain_b.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Module Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Text('Hello World'),
          ElevatedButton(
              onPressed: () {
                // go to placeholder page without autoroute
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PlaceHolderPage(
                            child: DomainAPage(),
                          )),
                );
              },
              child: Text("Go to DA Home")),
          ElevatedButton(
              onPressed: () {
                // go to placeholder page without autoroute
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PlaceHolderPage(
                            child: DomainBTestPage(),
                          )),
                );
              },
              child: Text("Go to DB Home")),
        ],
      ),
    );
  }
}
