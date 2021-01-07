import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList = FirebaseFirestore.instance.collection('profileInfo');

  final CollectionReference profile = FirebaseFirestore.instance.collection('personNamePhone');

  Future<void> createNamePhone(String name, String phone, String uid) async {
    return await profile
        .add({'name': name, 'phone': phone});
  }

  Future<void> createUserData(String roomName, String participants, int wLength, String uid) async {
    print(uid);
    return await profileList
        .add({'roomname': roomName, 'Participants': participants, 'wLength': wLength,'userID':uid});
  }

  Future updateUserList(String name, String gender, int score, String uid) async {

    return await profileList.doc(uid).update({
      'name': name, 'gender': gender, 'score': score
    });
  }


  Future getNamePhone() async {
    List itemsList = [];

    try {
      await profile.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
