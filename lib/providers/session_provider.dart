import 'package:get/get.dart';
import 'package:restoner_comensales/models/endpoint.dart';

class SessionProvider extends GetConnect {
  static SessionProvider get to => Get.find<SessionProvider>();

  Future<Endpoint> logIn({required int phone, required int country, required String password}) async {
    await 1.seconds.delay(); // POST
    return Endpoint(error: false, dataError: '', data: 'jwt token');
  }

  Future<Endpoint> codes({required int phoneRegister, required int country}) async {
    await 1.seconds.delay(); // POST
    return Endpoint(error: false, dataError: '', data: phoneRegister);
  }

  Future<Endpoint> phoneRegister({required int phone, required int code}) async {
    await 1.seconds.delay(); // PUT
    return Endpoint(error: false, dataError: '', data: {
      'phone': phone,
      'country': 0,
      'code': 123456,
    });
  }

  Future<Endpoint> comensal({
    required int phone,
    required int country,
    required int code,
    required String name,
    required String lastname,
    required String password,
  }) async {
    await 1.seconds.delay(); // POST
    return Endpoint(error: false, dataError: '', data: 'Registro exitoso');
  }
}
