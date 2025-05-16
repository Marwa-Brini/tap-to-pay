import 'package:get/get.dart';

class MainDrawerController extends GetxController{
  int groupeValue=0;

  selectDrawerItem(int index){
    groupeValue = index;
    update();
  }


}