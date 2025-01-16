import '../utils/shared_preferences/preferences_key.dart';
import '../utils/shared_preferences/preferences_manager.dart';

class ThemeService {

  Future<bool> isDarkMode() async {
    bool isDarkMode =  PreferencesManager.getBool(PreferencesKey.isDarkMode, false);
    print('isDarkMode get: $isDarkMode');
    return isDarkMode;
  }

  Future<void> saveTheme(bool isDarkMode) async {
    print('isDarkMode set: $isDarkMode');
    return PreferencesManager.setBool(PreferencesKey.isDarkMode, isDarkMode);
  }
}
