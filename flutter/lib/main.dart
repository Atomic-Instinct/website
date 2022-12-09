import 'package:flutter/material.dart';

void main() => runApp(const AtomicInstinctWebsite());

class AtomicInstinctWebsite extends StatelessWidget {
  const AtomicInstinctWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atomic Instinct',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset('images/logo.png'),
            ),
            const Text(
              'Atomic\nInstinct',
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
