import 'package:atomicinstinct/widgets.dart';
import 'package:flutter/widgets.dart';

class Desktop extends StatelessWidget {
  const Desktop();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
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
    );
  }
}
