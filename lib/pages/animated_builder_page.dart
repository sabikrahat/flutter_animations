import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  const AnimatedBuilderPage({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    //
    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
    //
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Builder'),
      ),
      body: Center(
        ///
        /// Animated Builder
        ///
        child: AnimatedBuilder(
          animation: animation,
          child: Container(
            color: Colors.red[100],
            height: 200,
            width: 200,
            child: const Center(child: Text('Animated Builder')),
          ),
          builder: (context, child) {
            return Transform.rotate(
              angle: animation.value,
              child: child,
            );
          },
        ),

        ///
        /// Animated Builder
        ///
      ),
    );
  }
}
