import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static SharedPreferences? _sharedPreferences;
  static FlutterSecureStorage? storage;

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  static const String prefIsUserLoggedIn = 'isUserLoggedIn';

  static const String prefUserId = 'userId';
  static const String prefFirstName = 'firstName';
  static const String prefImage = 'profileImage';
  static const String prefEmail = 'email';
  static const String prefToken = 'Token';
  static const String accountCode = 'AccountCode';
  static const String prefDeviceToken = 'device_token';
  static const String prefExtVersion = 'extVersion';
  static const String prefIntVersion = 'intVersion';
  static const String prefPackageName = 'packageName';
  static const String prefRememberPassword = 'rememberPassword';
  static const String prefPhoneNumber = 'phoneNumber';
  static const String prefAddressLine1 = 'addressLine1';
  static const String prefAddressLine2 = 'addressLine2';

  static const String prefCity = 'city';
  static const String prefCountry = 'country';
  static const String prefState = 'state';
  static const String prefZipCode = 'zip_code';
  static const String prefDob = 'dob';
  static const String prefGender = 'gender';
  static const String prefTravelAgentCode = 'travelAgentCode';

  static const String prefTempAddress1 = 'tempAddress1';
  static const String prefTempAddress2 = 'tempAddress2';
  static const String prefTempCity = 'tempCity';
  static const String prefTempState = 'tempState';
  static const String prefTempZipCode = 'tempZip_code';
  static const String prefTempCountry = 'tempCountry';

  static const String prefBankName = 'pref_bank_name';
  static const String prefBankAccountType = 'pref_bank_account_type';
  static const String prefBankBranchCode = 'pref_bank_branch_code';
  static const String prefBankAccountNumber = 'pref_bank_account_number';
  static const String preUserType = 'pref_user_type';

  // travel]

  static setIsUserLoggedIn(bool loggedIn) {
    _sharedPreferences?.setBool(prefIsUserLoggedIn, loggedIn);
  }

  static bool getIsUserLoggedIn() =>
      _sharedPreferences?.getBool(prefIsUserLoggedIn) ?? false;

  static setAccessToken(String accessToken) async {
    await setSecureString(prefToken, accessToken);
  }

  static Future<String> getAccessToken() async =>
      await getSecureString(prefToken);

  static setDeviceToken(String deviceToken) async {
    setSecureString(prefDeviceToken, deviceToken);
  }

  static Future<String> getDeviceToken() async =>
      await getSecureString(prefDeviceToken);

  static setFirstName(String firstName) {
    _sharedPreferences?.setString(prefFirstName, firstName);
  }

  static String getFirstName() =>
      _sharedPreferences?.getString(prefFirstName) ?? '';

  static setUserId(int userId) {
    _sharedPreferences?.setInt(prefUserId, userId);
  }

  static int getUserId() => _sharedPreferences?.getInt(prefUserId) ?? 0;

  static setProfileImage(String imageUrl) {
    _sharedPreferences?.setString(prefImage, imageUrl);
  }

  static String getProfileImage() =>
      _sharedPreferences?.getString(prefImage) ?? '';

  static setRememberPassword(String rememberPassword) {
    _sharedPreferences?.setString(prefRememberPassword, rememberPassword);
  }

  static String getRememberPassword() =>
      _sharedPreferences?.getString(prefRememberPassword) ?? '';

  static setEmail(String email) {
    _sharedPreferences?.setString(prefEmail, email);
  }

  static String getEmail() => _sharedPreferences?.getString(prefEmail) ?? '';

  static setPhoneNumber(String phoneNumber) {
    _sharedPreferences?.setString(prefPhoneNumber, phoneNumber);
  }

  static String getPhoneNumber() =>
      _sharedPreferences?.getString(prefPhoneNumber) ?? '';

  static setIntVersion(String version) {
    _sharedPreferences?.setString(prefIntVersion, version);
  }

  static String getIntVersion() =>
      _sharedPreferences?.getString(prefIntVersion) ?? '';

  static setExtVersion(String version) {
    _sharedPreferences?.setString(prefExtVersion, version);
  }

  static String getExtVersion() =>
      _sharedPreferences?.getString(prefExtVersion) ?? '';

  static setPackageName(String packageName) {
    _sharedPreferences?.setString(prefPackageName, packageName);
  }

  static String getPackageName() =>
      _sharedPreferences?.getString(prefPackageName) ?? '';

  static Future<String> getSecureString(String key,
      {String defaultValue = ""}) async {
    return await storage?.read(key: key) ?? defaultValue;
  }

  static Future<void> setSecureString(String key, String value) async =>
      await storage?.write(key: key, value: value);

  ///Permanent Address
  static setAddressLine1(String addressLine1) {
    _sharedPreferences?.setString(prefAddressLine1, addressLine1);
  }

  static String getAddressLine1() =>
      _sharedPreferences?.getString(prefAddressLine1) ?? '';

  static setAddressLine2(String addressLine2) {
    _sharedPreferences?.setString(prefAddressLine2, addressLine2);
  }

  static String getAddressLine2() =>
      _sharedPreferences?.getString(prefAddressLine2) ?? '';

  static setCity(String city) {
    _sharedPreferences?.setString(prefCity, city);
  }

  static String getCity() => _sharedPreferences?.getString(prefCity) ?? '';

  static setZipCode(String zipCode) {
    _sharedPreferences?.setString(prefZipCode, zipCode);
  }

  static String getZipCode() =>
      _sharedPreferences?.getString(prefZipCode) ?? '';

  static setState(String state) {
    _sharedPreferences?.setString(prefState, state);
  }

  static String getState() => _sharedPreferences?.getString(prefState) ?? '';

  // static setCountry(String country)  {
  //   _sharedPreferences?.setString(prefCountry, country);
  // }
  //
  // static String getCountry() => _sharedPreferences?.getString(prefCountry) ?? '';
  //
  /// Temporary Address

  static setTempAddress1(String tempAddress1) {
    _sharedPreferences?.setString(prefTempAddress1, tempAddress1);
  }

  static String getTempAddress1() =>
      _sharedPreferences?.getString(prefTempAddress1) ?? '';

  static setTempAddress2(String tempAddressLine2) {
    _sharedPreferences?.setString(prefTempAddress2, tempAddressLine2);
  }

  static String getTempAddress2() =>
      _sharedPreferences?.getString(prefTempAddress2) ?? '';

  static setTempCity(String tempCity) {
    _sharedPreferences?.setString(prefTempCity, tempCity);
  }

  static String getTempCity() =>
      _sharedPreferences?.getString(prefTempCity) ?? '';

  static setTempZipCode(String tempZipCode) {
    _sharedPreferences?.setString(prefTempZipCode, tempZipCode);
  }

  static String getTempZipCode() =>
      _sharedPreferences?.getString(prefTempZipCode) ?? '';

  static setTempState(String tempState) {
    _sharedPreferences?.setString(prefTempState, tempState);
  }

  static String getTempState() =>
      _sharedPreferences?.getString(prefTempState) ?? '';

  static setAgentCode(String agentCode) {
    _sharedPreferences?.setString(prefTravelAgentCode, agentCode);
  }

  static String getAgentCode() =>
      _sharedPreferences?.getString(prefTravelAgentCode) ?? '';

  ///Account Holder Name...
  static setAccountHolder(String agentCode) {
    _sharedPreferences?.setString(prefTravelAgentCode, agentCode);
  }

  static String getAccountHolder() =>
      _sharedPreferences?.getString(prefBankAccountNumber) ?? '';

  ///Account Bank Name...
  static setBankName(String bankName) {
    _sharedPreferences?.setString(prefBankName, bankName);
  }

  static String getBankName() =>
      _sharedPreferences?.getString(prefBankName) ?? '';

  ///Account Type...
  static setAccountType(String agentCode) {
    _sharedPreferences?.setString(prefBankAccountType, agentCode);
  }

  static String getAccountType() =>
      _sharedPreferences?.getString(prefBankAccountType) ?? '';

  ///Bank Branch Code...
  static setBankBranchCode(String branchCode) {
    _sharedPreferences?.setString(prefBankBranchCode, branchCode);
  }

  static String getBankBranchCode() =>
      _sharedPreferences?.getString(prefBankBranchCode) ?? '';

  ///Bank Branch Code...
  static setCountry(String country) {
    _sharedPreferences?.setString(prefCountry, country);
  }

  static String getCountry() =>
      _sharedPreferences?.getString(prefCountry) ?? '';

  ///Account Number...
  static setBankAccountNumber(String agentCode) {
    _sharedPreferences?.setString(prefBankAccountNumber, agentCode);
  }

  static String getBankAccountNumber() =>
      _sharedPreferences?.getString(prefBankAccountNumber) ?? '';

  static setUserType(String userType) {
    _sharedPreferences?.setString(preUserType, userType);
  }

  static String getUserType() =>
      _sharedPreferences?.getString(preUserType) ?? '';

  // Delete
  static Future<bool?> remove(String key) async =>
      await _sharedPreferences?.remove(key);

  static Future<void> clear() async {
    String fcmToken = await getDeviceToken();
    await _sharedPreferences?.clear();
    await PreferenceManager.setDeviceToken(fcmToken);
  }
}
