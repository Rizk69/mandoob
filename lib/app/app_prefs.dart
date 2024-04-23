import 'package:flutter/material.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/core/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = 'PREFS_KEY_LANG';
const String PREFS_KEY_IS_LOGGED_IN = 'PREFS_KEY_IS_LOGGED_IN';
const String PREFS_KEY_ONBOARDONG_VIEWED = "PREFS_KEY_ONBOARDONG_VIEWED";

// User Data
const String TOKEN = 'TOKEN';
const String USER_ID = 'USER_ID';
const String YEAR_ID = 'YEAR_ID';
const String STUDENT_ID = 'STUDENT_ID';
const String USER_AR_NAME = 'USER_AR_NAME';
const String USER_PICTURE = 'USER_PICTURE';
const String USER_TYPE_ID = 'USER_TYPE_ID';
const String USER_TYPE_AR_NAME = 'USER_TYPE_AR_NAME';
const String ROLE_ID = 'ROLE_ID';
const String TYPE_ID = 'TYPE_ID';
const String USER_EMAIL = 'USER_EMAIL';
const String IS_DARK = 'IS_DARK';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);
  Future<void> setRememberMe(bool value) async {
    await _sharedPreferences.setBool("REMEMBER_ME", value);
  }

  Future<bool> getRememberMe() async {
    return _sharedPreferences.getBool("REMEMBER_ME") ?? false;
  }

  Future<void> setRememberMeEmail(String email) async {
    await _sharedPreferences.setString("REMEMBER_ME_EMAIL", email);
  }
  Future<void> setRememberMePassword(String email) async {
    await _sharedPreferences.setString("REMEMBER_ME_PASSWORD", email);
  }

  Future<String> getRememberMeEmail() async {
    return _sharedPreferences.getString("REMEMBER_ME_EMAIL") ?? "";
  }

  Future<String> getRememberMePassword() async {
    return _sharedPreferences.getString("REMEMBER_ME_PASSWORD") ?? "";
  }

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ARABIC.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      /// set english
      _sharedPreferences.setString(
        PREFS_KEY_LANG,
        LanguageType.ENGLISH.getValue(),
      );
    } else {
      /// set arabic
      _sharedPreferences.setString(
        PREFS_KEY_LANG,
        LanguageType.ARABIC.getValue(),
      );
    }
  }

  Future<bool> getThemePreference() async {
    return _sharedPreferences.getBool("showRow") ?? false;
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

  Future<void> setUserLoggedIn(bool isLogin) async {
    _sharedPreferences.setBool(PREFS_KEY_IS_LOGGED_IN, isLogin);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_LOGGED_IN) ?? false;
  }

  Future<void> setOnBoardingViewed() async {
    await _sharedPreferences.setBool(PREFS_KEY_ONBOARDONG_VIEWED, true);
  }

  Future<bool> getOnBoardingViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDONG_VIEWED) ?? false;
  }

  ///********** USER DATA SETTER & GETTER **********
  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(TOKEN, token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(TOKEN) ?? "";
  }

  Future<void> setUserArName(String userArName) async {
    _sharedPreferences.setString(USER_AR_NAME, userArName);
  }

  Future<String> getUserArName() async {
    return _sharedPreferences.getString(USER_AR_NAME) ?? "";
  }

  Future<void> setUserEmail(String userEmail) async {
    _sharedPreferences.setString(USER_EMAIL, userEmail);
  }

  Future<String> getUserEmail() async {
    return _sharedPreferences.getString(USER_EMAIL) ?? "";
  }

  Future<void> setUserPicture(String userPicture) async {
    _sharedPreferences.setString(USER_PICTURE, userPicture);
  }

  Future<String> getUserPicture() async {
    return _sharedPreferences.getString(USER_PICTURE) ?? "";
  }

  Future<void> setUserTypeArName(String userTypeArName) async {
    _sharedPreferences.setString(USER_TYPE_AR_NAME, userTypeArName);
  }

  Future<String> getUserTypeArName() async {
    return _sharedPreferences.getString(USER_TYPE_AR_NAME) ?? "";
  }

  Future<void> setUserId(int userId) async {
    _sharedPreferences.setInt(USER_ID, userId);
  }

  Future<int> getUserId() async {
    return _sharedPreferences.getInt(USER_ID) ?? Constants.zero;
  }

  Future<void> setYearId(int yearId) async {
    _sharedPreferences.setInt(YEAR_ID, yearId);
  }

  Future<int> getYearId() async {
    return _sharedPreferences.getInt(YEAR_ID) ?? Constants.zero;
  }

  Future<void> setStudentId(int studentId) async {
    _sharedPreferences.setInt(STUDENT_ID, studentId);
  }

  Future<int> getStudentId() async {
    return _sharedPreferences.getInt(STUDENT_ID) ?? Constants.zero;
  }

  Future<void> setUserTypeId(int userTypeId) async {
    _sharedPreferences.setInt(USER_TYPE_ID, userTypeId);
  }

  Future<int> getUserTypeId() async {
    return _sharedPreferences.getInt(USER_TYPE_ID) ?? Constants.zero;
  }

  Future<void> setRoleId(int roleId) async {
    _sharedPreferences.setInt(ROLE_ID, roleId);
  }

  Future<int> getRoleId() async {
    return _sharedPreferences.getInt(ROLE_ID) ?? Constants.zero;
  }

  Future<void> setTypeId(int typeId) async {
    _sharedPreferences.setInt(TYPE_ID, typeId);
  }

  Future<int> getTypeId() async {
    return _sharedPreferences.getInt(TYPE_ID) ?? Constants.zero;
  }

  Future<void> setIsDark(bool isDark) async {
    _sharedPreferences.setBool(IS_DARK, isDark);
  }

  bool getIsDark() {
    return _sharedPreferences.getBool(IS_DARK) ?? false;
  }

  Future<void> logout() async {
    await _sharedPreferences.remove(PREFS_KEY_IS_LOGGED_IN);
    await _sharedPreferences.remove(TOKEN);
    await _sharedPreferences.remove(USER_ID);
    await _sharedPreferences.remove(YEAR_ID);
    await _sharedPreferences.remove(STUDENT_ID);
    await _sharedPreferences.remove(USER_AR_NAME);
    await _sharedPreferences.remove(USER_PICTURE);
    await _sharedPreferences.remove(USER_TYPE_ID);
    await _sharedPreferences.remove(USER_TYPE_AR_NAME);
    await _sharedPreferences.remove(ROLE_ID);
    await _sharedPreferences.remove(TYPE_ID);
  }
}
