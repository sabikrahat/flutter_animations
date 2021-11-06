import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: Center(
        child: Container(
          color: Colors.red[100],
          height: 200,
          width: 200,
          child: const Hero(
            tag: 'imageHero',
            child: Icon(
              Icons.touch_app_outlined,
              size: 55,
            ),
          ),
        ),
      ),
    );
  }
}
