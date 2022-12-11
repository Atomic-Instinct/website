import 'package:flutter/foundation.dart';
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
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.jpeg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              color: const Color(0x99000000),
            ),
            SingleChildScrollView(
              child: Column(
                children: const [
                  Header(),
                  Games(),
                  Footer(),
                ],
              ),
            ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GameEntry(
          nameStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Chicago',
            fontWeight: FontWeight.w100,
            fontSize: 30,
            height: 1.6,
            letterSpacing: 1.5,
          ),
          descriptionStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Chicago',
            fontWeight: FontWeight.w100,
            fontSize: 18,
            height: 1.6,
            letterSpacing: 1.5,
          ),
          name: 'Hextrategic',
          description:
              'A turn-based strategy game where you move units across a board to expand your territory and defeat your enemies. Choose a map. Command your units. Defeat your enemies. Conquer the board.',
          imagePath: 'images/hextrategic.png',
          androidUrl: 'https://play.google.com/store/apps/details?id=com.atomicinstinct.hextrategic&referrer=website&url=https://atomicinstinct.com',
          iosUrl: 'https://apps.apple.com/app/hextrategic/id6444746115',
          onTap: _onHextrategicWebsite,
        ),
        GameEntry(
          nameStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Bungee',
            fontWeight: FontWeight.w900,
            fontSize: 35,
            height: 1.32,
          ),
          descriptionStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Bungee',
            fontWeight: FontWeight.w900,
            fontSize: 22,
            height: 1.32,
          ),
          name: 'Tension Tunnel',
          description:
              'A casual, minimalist and challenging game that will put your focus, reflexes, and nerves to the test. Easy to learn but hard to master.',
          imagePath: 'images/tension-tunnel.png',
          androidUrl:
              'https://play.google.com/store/apps/details?id=com.atomicinstinct.tensiontunnel&referrer=website&url=https://atomicinstinct.com',
          iosUrl: 'https://apps.apple.com/app/tension-tunnel/id1608041401',
          onTap: _onTensionTunnelWebsite,
        ),
      ],
    );
  }

  void _onHextrategicWebsite() => launchUrl(Uri.parse('https://hextrategic.com'));

  void _onTensionTunnelWebsite() => launchUrl(Uri.parse('https://tensiontunnel.com'));
}

class GameEntry extends StatelessWidget {
  final TextStyle nameStyle;
  final TextStyle descriptionStyle;
  final String name;
  final String description;
  final String imagePath;
  final String androidUrl;
  final String iosUrl;
  final VoidCallback onTap;

  const GameEntry({
    required this.nameStyle,
    required this.descriptionStyle,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.androidUrl,
    required this.iosUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 100,
          right: 100,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DescriptionEntry(
              nameStyle: nameStyle,
              descriptionStyle: descriptionStyle,
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
      ),
    );
  }
}

class DescriptionEntry extends StatelessWidget {
  final TextStyle nameStyle;
  final TextStyle descriptionStyle;
  final String name;
  final String description;
  final String imagePath;
  final VoidCallback onTap;

  const DescriptionEntry({
    required this.nameStyle,
    required this.descriptionStyle,
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
              name.toUpperCase(),
              style: nameStyle,
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 250,
              child: Image.asset(imagePath),
            ),
            const SizedBox(height: 30),
            Text(
              description.toUpperCase(),
              textAlign: TextAlign.center,
              style: descriptionStyle,
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
        if (isAndroid || isDesktop)
          StoreButton(
            imagePath: 'images/google_play_badge.png',
            url: android,
          ),
        if (isIOS || isDesktop)
          StoreButton(
            imagePath: 'images/app_store_badge.png',
            url: ios,
          ),
      ],
    );
  }

  static final bool isAndroid = defaultTargetPlatform == TargetPlatform.android;

  static final bool isIOS = defaultTargetPlatform == TargetPlatform.iOS;

  static final bool isWindows = defaultTargetPlatform == TargetPlatform.windows;

  static final bool isLinux = defaultTargetPlatform == TargetPlatform.linux;

  static final bool isMac = defaultTargetPlatform == TargetPlatform.macOS;

  static final bool isDesktop = !isAndroid && !isIOS && (isWindows || isLinux || isMac);
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: _onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: SizedBox(
            height: 60,
            child: Image.asset(imagePath),
          ),
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
        top: 100,
        bottom: 50,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
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
          const SizedBox(height: 30),
          const SelectableText(
            'contact@atomicinstinct.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Copyright © Atomic Instinct 2023',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
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
