import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double size = 300;
  bool isSmall = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ///
            /// AnimatedContainer
            ///
            AnimatedContainer(
              curve: Curves.bounceOut, // so many curves
              color: Colors.red[100],
              height: isSmall ? size / 2 : size,
              width: isSmall ? size / 2 : size,
              duration: const Duration(seconds: 2),
              child: const Center(child: Text('Animated Container')),
            ),

            ///
            /// AnimatedContainer
            ///
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () => setState(() => isSmall = !isSmall),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Chnage Size'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
