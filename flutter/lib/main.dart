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
            Games(),
            Footer(),
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
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.red,
        child: Row(
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
        ),
      ),
    );
  }
}

class Games extends StatelessWidget {
  const Games();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        color: Colors.green,
      ),
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

class Footer extends StatelessWidget {
  const Footer();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}
