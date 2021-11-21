import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/components/custom_stepper.dart';
import 'package:restoner_comensales/config/app_themes.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
import 'package:unicons/unicons.dart';
import 'signup_controller.dart';
export 'signup_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.max, children: [
        const Icon(
          UniconsLine.angle_left_b,
          size: 30,
        ).mouse(() => Get.back()).aligned(Alignment.centerLeft),
        Text('Registro', style: Get.textTheme.title),
        kSpacerY,
        Obx(() => CustomStepper(steps: 3, selectedStep: controller.currentStep.value)),
        kSpacerY,
        Obx(() => const [_FirstStepView(), _SecondStepView(), _ThirdStepView()][controller.currentStep.value - 1]),
        kSpacer,
        ElevatedButton(
          child: const Text('Continuar'),
          onPressed: () => controller.nextStep(),
        )
      ]).p3.safeArea(),
    );
  }
}

class _FirstStepView extends GetView<SignUpController> {
  const _FirstStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(UniconsLine.phone),
            hintText: 'Número telefónico',
          ),
        ),
        kSpacerY,
        Text(
          'Al continuar, recibirá un código por mensaje para su validación',
          style: Get.textTheme.normal,
          textAlign: TextAlign.center,
        ).px4,
      ]).p3,
    );
  }
}

class _SecondStepView extends GetView<SignUpController> {
  const _SecondStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
        TextFormField(
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: '1  2  3  4  5',
          ),
        ),
        TextButton(child: const Text('Reenviar código'), onPressed: () {}),
        kSpacerY,
        Text(
          'Ingrese el código enviado por SMS al 0007',
          style: Get.textTheme.normal,
          textAlign: TextAlign.center,
        ).px4,
      ]).p3,
    );
  }
}

class _ThirdStepView extends GetView<SignUpController> {
  const _ThirdStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
      Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(UniconsLine.user),
              hintText: 'Nombre(s)',
            ),
          ),
          kSpacerY,
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(UniconsLine.tag_alt),
              hintText: 'Apellido(s)',
            ),
          ),
        ]).p3,
      ),
      kSpacerY,
      Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
          ValueBuilder<bool?>(
            initialValue: true,
            builder: (value, update) => TextFormField(
              obscureText: value!,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                prefixIcon: const Icon(UniconsLine.lock),
                suffixIcon: IconButton(
                  icon: Icon(value ? UniconsLine.eye : UniconsLine.eye_slash),
                  onPressed: () => update(!value),
                ),
              ),
            ),
          ),
          kSpacerY,
          ValueBuilder<bool?>(
            initialValue: true,
            builder: (value, update) => TextFormField(
              obscureText: value!,
              decoration: InputDecoration(
                hintText: 'Confirmar contraseña',
                prefixIcon: const Icon(UniconsLine.lock),
                suffixIcon: IconButton(
                  icon: Icon(value ? UniconsLine.eye : UniconsLine.eye_slash),
                  onPressed: () => update(!value),
                ),
              ),
            ),
          ),
        ]).p3,
      ),
    ]);
  }
}
