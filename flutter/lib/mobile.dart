import 'package:atomicinstinct/widgets.dart';
import 'package:flutter/widgets.dart';

class Mobile extends StatelessWidget {
  const Mobile();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage('background_mobile'),
        const BackgroundOverlay(),
        SingleChildScrollView(
          child: Column(
            children: const [
              FittedBox(
                child: Header(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
