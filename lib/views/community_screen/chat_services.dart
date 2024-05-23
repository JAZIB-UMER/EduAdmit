
import 'package:edu_admit/data_model/chat_model.dart';
import 'package:edu_admit/utils/utilities.dart';
import 'package:firebase_database/firebase_database.dart';


class ChatServices {
  //RealTime DataBase
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Chats');

  Future sendMessage(GroupChat chat) async {
    await ref
        .push()
        .set(chat.toMap())
        .then((value) {})
        .onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }
}
