import 'package:flutter/material.dart';

class AnimatedPositionedPage extends StatefulWidget {
  const AnimatedPositionedPage({Key? key}) : super(key: key);

  @override
  _AnimatedPositionedPageState createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  bool isCenter = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Positioned'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () => setState(() => isCenter = !isCenter),
              icon: const Icon(Icons.replay_outlined),
              color: Colors.red[400],
            ),
          )
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            ///
            /// AnimatedPositioned
            ///
            AnimatedPositioned(
              top: isCenter
                  ? ((size.height - 56) / 2) - 100
                  : 0, // here 56 is the default height of scaffold's appbar
              left: isCenter
                  ? (size.width / 2) - 100
                  : 0, // here height and width both are 200 which half is 100
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 2),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.red[100],
                child: const Center(child: Text('Animated Positioned')),
              ),
            ),

            ///
            /// AnimatedPositioned
            ///
          ],
        ),
      ),
    );
  }
}
