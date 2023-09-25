import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  StreamDateTime createState() => StreamDateTime();
}

class StreamDateTime extends State<HomePage> {
  late DateTime nowDateTime;
  late Stream<DateTime> dateTimeStream;
  @override
  void initState() {
    super.initState();

    dateTimeStream = Stream<DateTime>.periodic(
      const Duration(seconds: 1),
      (count) => DateTime.now(),
    );

    dateTimeStream.listen((dateTime) {
      setState(() {
        nowDateTime = dateTime;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Stream'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' Date:  ${nowDateTime.toString().substring(0, 10)} \n Time:${nowDateTime.toString().substring(10, 19)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
