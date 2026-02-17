import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  static Future<void> storePassword(String password)async{
    final storage =   FlutterSecureStorage();
    await  storage.write(key: "password", value: password);
  }


  static Future<String?>loadPassword()async{
    final storage =   FlutterSecureStorage();
    return await storage.read(key: "password");
  }

  static Future<void>removePasword()async{
    final storage =   FlutterSecureStorage();
    await storage.delete(key: "password");
  }
}