import 'package:get/get.dart';
import 'package:inst_pay/model/contact_model.dart';
import 'package:inst_pay/service/local/contact_service.dart';

class ContactController extends GetxController {
  String? finalSelectedContact;
  String selectedContact = '';
  List<ContactModel> contact = [];
  List<ContactModel> filterContact = [];

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
    if (contact.isNotEmpty) {
      return contact;
    }
    print('get contact');

    contact = await ContactService.getContacts();
    filterContact = contact;
    update();
    return contact;
  }

  Future addContact(String name, String rib) async {
    await ContactService.createContactAccount(
      name: name,
      rib: rib,
      bankID: int.parse(rib.substring(0, 2)),
    );
    contact.clear();
    update();
    // await getContacts();
  }

  Future deleteContact(int id) async {
    try {
      await ContactService.deleteContact(id);
      contact.removeWhere((e) => e.id == id);
      contact.clear();
      update();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  void searchContact(String value) {
    if (value.isEmpty) {
      filterContact = contact;
    } else {
      filterContact =
          contact
              .where(
                (element) =>
                    element.name.toLowerCase().contains(value.toLowerCase()),
              )
              .toList();
    }

    update();
  }
}
