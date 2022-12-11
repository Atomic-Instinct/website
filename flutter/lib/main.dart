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
        fontFamily: 'ZenDots',
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: const [
            Header(),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset('images/logo.png'),
        ),
        const Text(
          'Atomic\nInstinct',
          style: TextStyle(
            color: Colors.white,
            fontSize: 70,
          ),
        ),
      ],
    );
  }
}

class GameEntry extends StatelessWidget {
  const GameEntry();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset('images/logo.png'),
        ),
      ],
    );
  }
}
