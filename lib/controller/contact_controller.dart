import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:inst_pay/model/contact_model.dart';
import 'package:inst_pay/service/local/contact_service.dart';

class ContactController extends GetxController {
  String? finalSelectedContact;
  String selectedContact = '';
  List<ContactModel> contact = [];
  void selectContact(String rib) {
    selectedContact = rib;
    update();
  }

  void selectfinalContact() {
    finalSelectedContact = selectedContact;
    update();
  }

  void resetSelectedController() {
    selectedContact = '';
    finalSelectedContact = null;
  }

  Future<List<ContactModel>> getContacts() async {
    print('get contact');
    contact = await ContactService.getContacts();
    update();
    return contact;
  }

  Future addContact(String name, String rib) async {
    await ContactService.createContactAccount(
      name: name,
      rib: rib,
      bankID: int.parse(rib.substring(0, 2)),
    );
    // await getContacts();
  }
}
