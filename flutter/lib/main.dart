import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const AtomicInstinctWebsite());

class AtomicInstinctWebsite extends StatelessWidget {
  const AtomicInstinctWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atomic Instinct',
      debugShowCheckedModeBanner: false,
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
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
            child: Image.asset('images/logo.png'),
          ),
          const FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Atomic\nInstinct',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 200,
                ),
              ),
            ),
          ),
        ],
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialMediaEntry(
            path: 'images/instagram.png',
            onTap: _onInstagram,
          ),
          SocialMediaEntry(
            path: 'images/twitter.png',
            onTap: _onTwitter,
          ),
          SocialMediaEntry(
            path: 'images/youtube.png',
            onTap: _onYoutube,
          ),
        ],
      ),
    );
  }

  void _onInstagram() => launchUrl(Uri.parse('https://www.instagram.com/atomicinstinct'));

  void _onYoutube() => launchUrl(Uri.parse('https://www.youtube.com/@atomicinstinct'));

  void _onTwitter() => launchUrl(Uri.parse('https://twitter.com/instinct_atomic'));
}

class SocialMediaEntry extends StatefulWidget {
  final String path;
  final VoidCallback onTap;

  const SocialMediaEntry({
    required this.path,
    required this.onTap,
  });

  @override
  State<SocialMediaEntry> createState() => _SocialMediaEntryState();
}

class _SocialMediaEntryState extends State<SocialMediaEntry> {
  double opacity = 0.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (event) {
            setState(() {
              opacity = 1;
            });
          },
          onExit: (event) {
            setState(() {
              opacity = 0.5;
            });
          },
          child: SizedBox(
            height: 500,
            child: Opacity(
              opacity: opacity,
              child: Image.asset(widget.path),
            ),
          ),
        ),
      ),
    );
  }
}
