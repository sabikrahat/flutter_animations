import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationPage extends StatefulWidget {
  const LottieAnimationPage({Key? key}) : super(key: key);

  @override
  State<LottieAnimationPage> createState() => _LottieAnimationPageState();
}

class _LottieAnimationPageState extends State<LottieAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
    );

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        controller.reset();
      }
    });
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
        title: const Text('Lottie Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.network(
              'https://assets7.lottiefiles.com/temp/lf20_IxpQni.json'),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: const Icon(
                Icons.delivery_dining,
                size: 42,
              ),
              label: const Text('Confirmation'),
              onPressed: showDoneDialog,
            ),
          ),
        ],
      ),
    );
  }

  void showDoneDialog() => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 60.0, vertical: 36.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/done.json',
                repeat: false,
                controller: controller,
                onLoaded: (composition) {
                  controller.duration = composition.duration;
                  controller.forward();
                },
              ),
              const Text(
                'Enjoy your order',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      );
}
