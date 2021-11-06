import 'package:flutter/material.dart';

class CombinedAnimatedPage extends StatefulWidget {
  const CombinedAnimatedPage({Key? key}) : super(key: key);

  @override
  _CombinedAnimatedPageState createState() => _CombinedAnimatedPageState();
}

class _CombinedAnimatedPageState extends State<CombinedAnimatedPage> {
  bool isCenter = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combine Animation'),
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
                  ? ((size.height - 56) / 2) - 50 - 12.5
                  : 0, // here 56 is the default height of scaffold's appbar
              right: isCenter
                  ? (size.width / 2) - 25
                  : 0, // here height and width both are 200 which half is 100
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 2),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.red[100],
                child: const Center(child: Text('A')),
              ),
            ),
            AnimatedPositioned(
              bottom: isCenter
                  ? ((size.height - 56) / 2) - 50 - 12.5
                  : 0, // here 56 is the default height of scaffold's appbar
              left: isCenter
                  ? (size.width / 2) - 25
                  : 0, // here height and width both are 200 which half is 100
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 2),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.green[100],
                child: const Center(child: Text('B')),
              ),
            ),

            ///
            /// AnimatedPositioned
            ///
            if(isCenter)
              const AnimatedAlign(
                alignment: Alignment.center,
                duration: Duration(seconds: 3),
                child: Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Combine Animation'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
