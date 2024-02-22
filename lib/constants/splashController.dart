import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  void SetSplash(e) {
    box.write('splash', e);
  }

  bool GetSplash() {
    if (box.read('splash') == null) {
      box.write('splash', false);
    }
    bool SplashShow = box.read('splash');

    return SplashShow;
  }
}
