import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottomNavController extends GetxController {
  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
