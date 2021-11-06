import 'package:flutter/material.dart';
import 'package:flutter_animations/pages/lottie_animation_page.dart';
import 'pages/animated_builder_page.dart';
import 'pages/animated_container_page.dart';
import 'pages/animated_positioned_page.dart';
import 'pages/combined_animation_page.dart';
import 'pages/hero_animation_page.dart';
import 'pages/tween_animation_builder_page.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Animations')),
      body: ListView(
        children: [
          kListTile(
            context: context,
            title: 'Animated Container',
            child: const AnimatedContainerPage(),
          ),
          kListTile(
            context: context,
            title: 'Tween Animation Builder',
            child: const TweenAnimationBuilderPage(),
          ),
          kListTile(
            context: context,
            title: 'Animated Positioned',
            child: const AnimatedPositionedPage(),
          ),

          ///
          /// Hero Animation
          ///
          Card(
            elevation: 5.0,
            child: ListTile(
              leading: const Hero(
                  tag: 'imageHero', child: Icon(Icons.touch_app_outlined)),
              title: const Text('Hero Animation'),
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  child: const HeroAnimation(),
                  type: PageTransitionType.rightToLeft,
                ),
              ),
            ),
          ),
          ///
          /// Hero ANimation Ended 
          ///
          kListTile(
            context: context,
            title: 'Animated Builder',
            child: const AnimatedBuilderPage(),
          ),
          kListTile(
            context: context,
            title: 'Combined Animation',
            child: const CombinedAnimatedPage(),
          ),
          kListTile(
            context: context,
            title: 'Lottie Animation (Pub)',
            child: const LottieAnimationPage(),
          ),
        ],
      ),
    );
  }

  Card kListTile({
    required BuildContext context,
    required String title,
    required Widget child,
  }) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        leading: const Icon(Icons.touch_app_outlined),
        title: Text(title),
        onTap: () => Navigator.push(
          context,
          PageTransition(
            child: child,
            type: PageTransitionType.rightToLeft,
          ),
        ),
      ),
    );
  }
}
