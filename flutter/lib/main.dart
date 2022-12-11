import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  setUrlStrategy(EmptyUrlStrategy());
  runApp(const AtomicInstinctWebsite());
}

class AtomicInstinctWebsite extends StatelessWidget {
  const AtomicInstinctWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atomic Instinct',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              Header(),
              Games(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Image.asset('images/logo.png'),
            ),
            const Text(
              'Atomic\nInstinct',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'ZenDots',
                fontSize: 70,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Text(
          'We are an indie video game studio making fun games',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}

class Games extends StatelessWidget {
  const Games();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GameEntry(
            name: 'Hextrategic',
            description:
                'Hextrategic is a turn-based strategy game where you move units across a board to expand your territory and defeat your enemies. Choose a map. Command your units. Defeat your enemies. Conquer the board.',
            imagePath: 'images/hextrategic.png',
            androidUrl:
                'https://play.google.com/store/apps/details?id=com.atomicinstinct.hextrategic&referrer=website&url=https://atomicinstinct.com',
            iosUrl: 'https://apps.apple.com/app/hextrategic/id6444746115',
            onTap: _onHextrategicWebsite,
          ),
          GameEntry(
            name: 'Tension Tunnel',
            description:
                'Tension Tunnel is a casual, minimalist and challenging game that will put your focus, reflexes, and nerves to the test. The game has simple mechanics but it requires high dexterity and precise execution from the player.',
            imagePath: 'images/tension-tunnel.png',
            androidUrl:
                'https://play.google.com/store/apps/details?id=com.atomicinstinct.tensiontunnel&referrer=website&url=https://atomicinstinct.com',
            iosUrl: 'https://apps.apple.com/app/tension-tunnel/id1608041401',
            onTap: _onTensionTunnelWebsite,
          ),
        ],
      ),
    );
  }

  void _onHextrategicWebsite() => launchUrl(Uri.parse('https://hextrategic.com'));

  void _onTensionTunnelWebsite() => launchUrl(Uri.parse('https://tensiontunnel.com'));
}

class GameEntry extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;
  final String androidUrl;
  final String iosUrl;
  final VoidCallback onTap;

  const GameEntry({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.androidUrl,
    required this.iosUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 100,
        right: 100,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DescriptionEntry(
            name: name,
            description: description,
            imagePath: imagePath,
            onTap: onTap,
          ),
          const SizedBox(height: 30),
          StoreButtons(
            android: androidUrl,
            ios: iosUrl,
          ),
        ],
      ),
    );
  }
}

class DescriptionEntry extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;
  final VoidCallback onTap;

  const DescriptionEntry({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 300,
              child: Image.asset(imagePath),
            ),
            const SizedBox(height: 30),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreButtons extends StatelessWidget {
  final String android;
  final String ios;

  const StoreButtons({
    required this.android,
    required this.ios,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StoreButton(
          imagePath: 'images/google_play_badge.png',
          url: android,
        ),
        const SizedBox(width: 50),
        StoreButton(
          imagePath: 'images/app_store_badge.png',
          url: ios,
        ),
      ],
    );
  }
}

class StoreButton extends StatelessWidget {
  final String imagePath;
  final String url;

  const StoreButton({
    required this.imagePath,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          height: 75,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }

  void _onTap() => launchUrl(Uri.parse(url));
}

class Footer extends StatelessWidget {
  const Footer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        bottom: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialMediaEntry(
            path: 'images/instagram.png',
            onTap: _onInstagram,
          ),
          const SizedBox(width: 50),
          SocialMediaEntry(
            path: 'images/twitter.png',
            onTap: _onTwitter,
          ),
          const SizedBox(width: 50),
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
    return GestureDetector(
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
          height: 60,
          child: Opacity(
            opacity: opacity,
            child: Image.asset(widget.path),
          ),
        ),
      ),
    );
  }
}

class EmptyUrlStrategy extends HashUrlStrategy {
  EmptyUrlStrategy([
    super.platformLocation,
  ]) : _basePath = stripTrailingSlash(extractPathname(checkBaseHref(
          platformLocation.getBaseHref(),
        )));

  final String _basePath;

  @override
  String getPath() => _basePath;

  @override
  String prepareExternalUrl(String internalUrl) => _basePath;
}
