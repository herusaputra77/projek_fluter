import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
              controller: controller.pagecont,
              onPageChanged: controller.selectedPageIndex,
              itemCount: controller.onboardingpage.length,
              itemBuilder: ((context, index) {
                return Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          controller.onboardingpage[index].imageAsset,
                          height: 300,
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          controller.onboardingpage[index].title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64),
                          child: Text(
                            controller.onboardingpage[index].deskripsi,
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                );
              })),
          Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                  children: List.generate(
                controller.onboardingpage.length,
                (index) => Obx(() {
                  return Container(
                    margin: EdgeInsets.all(4),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: controller.selectedPageIndex.value == index
                            ? Colors.red
                            : Colors.grey,
                        shape: BoxShape.circle),
                  );
                }),
              ))),
          Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  controller.lanjutaksi();
                },
                child: Text('Next'),
              ))
        ]),
      ),
    );
  }
}
