import 'package:atomicinstinct/widgets.dart';
import 'package:flutter/widgets.dart';

class Mobile extends StatelessWidget {
  const Mobile();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundImage('background_mobile'),
        BackgroundOverlay(),
        SingleChildScrollView(
          child: Column(
            children: [
              FittedBox(
                child: Header(),
              ),
              Games(),
              Footer(),
            ],
          ),
        ),
      ],
    );
  }
}
