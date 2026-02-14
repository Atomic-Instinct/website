import 'package:atomicinstinct/widgets.dart';
import 'package:flutter/widgets.dart';

class Desktop extends StatelessWidget {
  const Desktop();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundImage('background_desktop'),
        BackgroundOverlay(),
        SingleChildScrollView(
          child: Column(
            children: [
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
