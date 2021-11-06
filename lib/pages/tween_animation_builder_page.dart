import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TweenAnimationBuilderPage extends StatefulWidget {
  const TweenAnimationBuilderPage({Key? key}) : super(key: key);

  @override
  _TweenAnimationBuilderPageState createState() =>
      _TweenAnimationBuilderPageState();
}

class _TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tween Animation Builder')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ///
            /// TweenAnimationBilder
            ///
            TweenAnimationBuilder(
              curve: Curves.bounceOut,
              tween: Tween<double>(begin: 0, end: 300),
              duration: const Duration(seconds: 3),
              builder: (BuildContext context, double x, Widget? child) {
                return Container(
                  height: x,
                  width: x,
                  color: Colors.red[100],
                  child: const Center(child: Text('Tween Animation Builder')),
                );
              },
            ),

            ///
            /// TweenAnimationBilder
            ///
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    child: const TweenAnimationBuilderPage(),
                    type: PageTransitionType.fade,
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Reload'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
