import 'package:basic_app/logic/auth/AuthStatus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtil {

  void setAuthStatus(int authStatus) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("auth_status", authStatus);
  }

  Future<int> getAuthStatus() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("auth_status");
  }
}