import 'dart:async';

class BigBlocRepository {
  Future<void> loadAsync(String token) async {
    /// write from keystore/keychain
    await Future.delayed(new Duration(seconds: 2));
  }

  Future<void> saveAsync(String token) async {
    /// write from keystore/keychain
    await Future.delayed(new Duration(seconds: 2));
  }

  BigBlocRepository();

  static int index = 1;

  void test() {
    index++;
  }
}
