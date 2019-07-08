import 'package:startup_namer/screens/big_bloc/index.dart';

class BigBlocProvider {
  final BigBlocRepository _bigBlocRepository = new BigBlocRepository();

  BigBlocProvider();

  void test() {
    this._bigBlocRepository.test();
  }
}
