import 'package:get/state_manager.dart';

class ProfileScreenController extends GetxController{
  int selectedIndex=0;

  void selectIndex(int index){
    selectedIndex = index;
    update();
  }
}