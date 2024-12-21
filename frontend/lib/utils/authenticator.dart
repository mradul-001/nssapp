import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _tokenKey = 'auth_token';

  // Save token
  Future<void> saveToken(String? token) async {
    if (token != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(_tokenKey, token);
    } else {
      print("Token is null, cannot save");
    }
  }

  // Check if token exists (logged in)
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(_tokenKey);
    return token != null;  // If token exists, the user is logged in
  }

  // Get the stored token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Log out by clearing the token
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_tokenKey);
  }
}
