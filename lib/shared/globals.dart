import 'dart:io';

final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');
const String USER_STORAGE_KEY = 'User';
const String USER_CREDENTIALS = 'UserCredentials';