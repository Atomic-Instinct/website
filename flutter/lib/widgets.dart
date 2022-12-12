import 'package:atomicinstinct/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class BackgroundImage extends StatelessWidget {
  final String fileName;

  const BackgroundImage(this.fileName);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/$fileName.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class BackgroundOverlay extends StatelessWidget {
  const BackgroundOverlay();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x99000000),
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
        const SizedBox(height: 50),
        SizedBox(
          width: 750,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'We are a passionate indie video game studio focused primarily on mobile platforms. We make sure to pour all our hearts in every game we make to deliver the best experience to our players.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: isDesktop ? 20 : 30,
                fontFamily: 'ZenDots',
              ),
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

class Games extends StatelessWidget {
  const Games();

  @override
  Widget build(BuildContext context) {
    if (isDesktop) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final GameEntry entry in gameEntries) Expanded(child: entry),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: gameEntries,
      );
    }
  }
}

const List<GameEntry> gameEntries = [
  GameEntry(
    nameStyle: TextStyle(
      color: Colors.white,
      fontFamily: 'Chicago',
      fontWeight: FontWeight.w100,
      fontSize: 30,
      height: 1.6,
      letterSpacing: 1.5,
    ),
    descriptionStyle: TextStyle(
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
    nameStyle: TextStyle(
      color: Colors.white,
      fontFamily: 'Bungee',
      fontWeight: FontWeight.w900,
      fontSize: 35,
      height: 1.32,
    ),
    descriptionStyle: TextStyle(
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
    androidUrl: 'https://play.google.com/store/apps/details?id=com.atomicinstinct.tensiontunnel&referrer=website&url=https://atomicinstinct.com',
    iosUrl: 'https://apps.apple.com/app/tension-tunnel/id1608041401',
    onTap: _onTensionTunnelWebsite,
  ),
];

void _onHextrategicWebsite() => launchUrl(Uri.parse('https://hextrategic.com'));

void _onTensionTunnelWebsite() => launchUrl(Uri.parse('https://tensiontunnel.com'));

class GameEntry extends StatefulWidget {
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
  State<GameEntry> createState() => _GameEntryState();
}

class _GameEntryState extends State<GameEntry> {
  double opacity = 0;

  double get initialOpacity => isMobile ? 1 : 0.65;

  @override
  void initState() {
    super.initState();
    opacity = initialOpacity;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: isDesktop ? 120 : 30,
        right: isDesktop ? 120 : 30,
      ),
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            opacity = 1;
          });
        },
        onExit: (event) {
          setState(() {
            opacity = initialOpacity;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DescriptionEntry(
              opacity: opacity,
              nameStyle: widget.nameStyle,
              descriptionStyle: widget.descriptionStyle,
              name: widget.name,
              description: widget.description,
              imagePath: widget.imagePath,
              onTap: widget.onTap,
            ),
            const SizedBox(height: 30),
            StoreButtons(
              android: widget.androidUrl,
              ios: widget.iosUrl,
              opacity: opacity,
            ),
            if (isMobile) const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class DescriptionEntry extends StatelessWidget {
  final double opacity;
  final TextStyle nameStyle;
  final TextStyle descriptionStyle;
  final String name;
  final String description;
  final String imagePath;
  final VoidCallback onTap;

  const DescriptionEntry({
    required this.opacity,
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
            Opacity(
              opacity: opacity,
              child: Text(
                name.toUpperCase(),
                style: nameStyle,
              ),
            ),
            const SizedBox(height: 30),
            Opacity(
              opacity: opacity,
              child: SizedBox(
                height: 250,
                child: Image.asset(imagePath),
              ),
            ),
            const SizedBox(height: 30),
            Opacity(
              opacity: opacity,
              child: Text(
                description.toUpperCase(),
                textAlign: TextAlign.center,
                style: descriptionStyle,
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
  final double opacity;

  const StoreButtons({
    required this.android,
    required this.ios,
    required this.opacity,
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
            opacity: opacity,
          ),
        if (isIOS || isDesktop)
          StoreButton(
            imagePath: 'images/app_store_badge.png',
            url: ios,
            opacity: opacity,
          ),
      ],
    );
  }
}

class StoreButton extends StatelessWidget {
  final String imagePath;
  final String url;
  final double opacity;

  const StoreButton({
    required this.imagePath,
    required this.url,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: _onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Opacity(
            opacity: opacity,
            child: SizedBox(
              height: 60,
              child: Image.asset(imagePath),
            ),
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
      padding: EdgeInsets.only(
        top: isDesktop ? 150 : 50,
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
          const SizedBox(height: 50),
          if (isMobile)
            Link(
              uri: Uri.parse('mailto:contact@atomicinstinct.com'),
              target: LinkTarget.blank,
              builder: (context, followLink) => GestureDetector(
                onTap: () {
                  followLink?.call();
                  _onEmail();
                },
                child: const Text(
                  'contact@atomicinstinct.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          else
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

  void _onEmail() {
    if (isMobile) {
      launchUrl(Uri.parse('mailto:contact@atomicinstinct.com'));
    }
  }
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
  double opacity = 0;

  double get initialOpacity => isMobile ? 1 : 0.65;

  @override
  void initState() {
    super.initState();
    opacity = initialOpacity;
  }

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
            opacity = initialOpacity;
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
