import 'package:atomicinstinct/widgets.dart';
import 'package:flutter/widgets.dart';

class Desktop extends StatelessWidget {
  const Desktop();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage('background_desktop'),
        const BackgroundOverlay(),
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
    );
  }
}
