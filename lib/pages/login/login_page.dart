import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/components/restoner_logo.dart';
import 'package:restoner_comensales/config/app_pages.dart';
import 'package:restoner_comensales/config/app_themes.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
import 'package:unicons/unicons.dart';
import 'login_controller.dart';
export 'login_controller.dart';

class LogInPage extends GetView<LogInController> {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.max, children: [
        const RestonerLogo().px4.expanded(2),
        Form(
          key: controller.formKey,
          child: Card(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
              TextFormField(
                controller: controller.phoneField,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Número telefónico',
                  prefixIcon: Icon(UniconsLine.globe),
                ),
              ),
              kSpacerY,
              ValueBuilder<bool?>(
                initialValue: true,
                builder: (value, update) => TextFormField(
                  controller: controller.passwordField,
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
              ElevatedButton(
                child: const Text('Ingresar'),
                onPressed: () => controller.logIn(),
              ),
              kSpacerY2,
              TextButton(
                child: const Text('Recuperar contraseña'),
                onPressed: () {},
              ),
              kDivider.pb2,
              ElevatedButton(
                child: const Text('Registrarse'),
                style: ElevatedButton.styleFrom(primary: kBackgroundColor, onPrimary: kPrimaryColor),
                onPressed: () => Get.toNamed(Routes.SIGN_UP),
              ),
            ]).p3,
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(style: Get.textTheme.info.copyWith(color: Colors.black), children: const [
            TextSpan(text: 'Continuar implica que usted ha leído y acpetado los'),
            TextSpan(text: 'Términos y Condiciones', style: TextStyle(color: kInfoColor, decoration: TextDecoration.underline)),
            TextSpan(text: ', '),
            TextSpan(text: 'Política de privacidad', style: TextStyle(color: kInfoColor, decoration: TextDecoration.underline)),
          ]),
        ).centered().expanded(),
      ]).p3.safeArea(),
    );
  }
}
