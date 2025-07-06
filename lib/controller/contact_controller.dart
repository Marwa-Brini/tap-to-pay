import 'package:get/get.dart';

class ContactController extends GetxController{
  String? finalSelectedContact;
  String selectedContact='';

  void selectContact(String rib){
    selectedContact = rib;
    update();
  }
void selectfinalContact(){
    finalSelectedContact = selectedContact;
    update();
  }

  void resetSelectedController(){
    selectedContact = '';
    finalSelectedContact=null;
  }
}