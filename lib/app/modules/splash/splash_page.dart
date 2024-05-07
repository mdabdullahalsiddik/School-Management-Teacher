import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.school_outlined,
          size: 100,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Theme.of(context).colorScheme.primary,
            size: 50,
          ),
        ),
      ),
    );
  }
}
