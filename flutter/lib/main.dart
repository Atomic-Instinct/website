import 'package:atomicinstinct/desktop.dart';
import 'package:atomicinstinct/mobile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(EmptyUrlStrategy());
  runApp(const AtomicInstinctWebsite());
}

class AtomicInstinctWebsite extends StatelessWidget {
  const AtomicInstinctWebsite();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atomic Instinct',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: isMobile ? const Mobile() : const Desktop(),
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

final bool isAndroid = defaultTargetPlatform == TargetPlatform.android;

final bool isIOS = defaultTargetPlatform == TargetPlatform.iOS;

final bool isWindows = defaultTargetPlatform == TargetPlatform.windows;

final bool isLinux = defaultTargetPlatform == TargetPlatform.linux;

final bool isMac = defaultTargetPlatform == TargetPlatform.macOS;

final bool isMobile = isAndroid || isIOS;

final bool isDesktop = !isAndroid && !isIOS && (isWindows || isLinux || isMac);
