import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static Future<void> setName(String name)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
  }

  static  setCoin(int coin)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("coin", coin);
  }

  static  setScore(int score)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("score", score);
  }

  static Future<int?> loadScore()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("score");
  }

  static Future<String?> loadName()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }

  static Future<int?> loadCoin()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("coin");
  }

  static Future<bool> removeName()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("name");
  }
  static Future<bool> removeCoin()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("coin");
  }
}