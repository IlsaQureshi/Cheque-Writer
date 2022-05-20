
import 'package:shared_preferences/shared_preferences.dart';

class Prefs
{
  static Future<String> getMemo()async
  {
    final pref=await SharedPreferences.getInstance();
    return pref.getString('mpass') ?? '';
  }

  static Future setMemo(String value)async
  {
    final pref=await SharedPreferences.getInstance();
    pref.setString('mpass',value);
  }

  static Future setStat(bool value)async
  {
    final pref=await SharedPreferences.getInstance();
    pref.setBool('ismpass',value);
  }

  static Future<bool> getStat()async
  {
    final pref=await SharedPreferences.getInstance();
    return pref.getBool('ismpass') ?? false;
  }

  static Future setTpass(String value)async
  {
    final pref=await SharedPreferences.getInstance();
    pref.setString('tpass',value);
  }

  static Future<String> getTpass()async
  {
    final pref=await SharedPreferences.getInstance();
    return pref.getString('tpass') ?? '';
  }
}