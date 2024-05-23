import 'dart:io';

import 'package:edu_admit/data_model/chat_model.dart';

import 'package:edu_admit/services/auth_services/user_id.dart';
import 'package:edu_admit/utils/colors.dart';
import 'package:edu_admit/views/community_screen/chat_services.dart';
import 'package:edu_admit/views/community_screen/community_consts.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  const ChatScreen({super.key, required this.userName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FocusNode myFocusNode = FocusNode();

  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1000), () => scrollDown());
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    scrollController.dispose();
    messageController.dispose();
    super.dispose();
  }

  ScrollController scrollController = ScrollController();
  //Scroll Down()
  void scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
              FocusScope.of(context).unfocus();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: appThemeColor,
        title: Text(
          'Community Chat',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: FirebaseDatabase.instance
                    .ref()
                    .child('Chats')
                    .orderByChild('timeStamp')
                    .onValue,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data!.snapshot.value == null) {
                    return const Center(child: Text('No data available'));
                  } else if (snapshot.error is SocketException) {
                    return const Center(child: Text('No Internet'));
                  } else {
                    // Extract data from the snapshot
                    var data = snapshot.data!.snapshot.value;
                    List<GroupChat> chats = [];

                    // Convert data to a list of GroupChat objects
                    data.forEach((key, value) {
                      if (value != null) {
                        chats.add(GroupChat.fromMap(value));
                      }
                      chats.sort((a, b) => a.timeStamp.compareTo(b.timeStamp));
                    });

                    return ListView.builder(
                      controller: scrollController,
                      itemCount: chats.length,
                      reverse: false,
                      itemBuilder: (BuildContext context, int index) {
                        bool isMe = false;
                        if (chats[index].id == SessionController().userId) {
                          isMe = true;
                        }
                        DateTime dateTime =
                            DateTime.parse(chats[index].createdAt);
                        var storedTime = storeDateTime(dateTime);
                        return MessageBubble(
                          sender: chats[index].sender.toString(),
                          text: chats[index].message,
                          isMe: isMe,
                          time: storedTime,
                        );
                      },
                    );
                  }
                }),
          ),
          //-------------------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: myFocusNode,
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffF43C3E)),
                          borderRadius: BorderRadius.circular(100)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffF43C3E)),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xffF43C3E),
                  ),
                  onPressed: () {
                    String messageText = messageController.text.trim();
                    if (messageText.isNotEmpty) {
                      // Get the current timestamp
                      var timestamp = ServerValue.timestamp;
                      var chat = GroupChat(
                          id: SessionController().userId.toString(),
                          sender: widget.userName.toString(),
                          message: messageController.text.toString(),
                          createdAt: DateTime.now().toString(),
                          timeStamp: timestamp);
                      ChatServices().sendMessage(chat).then((value) {
                        // Scroll the ListView to the bottom
                        scrollDown();
                        messageController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String storeDateTime(DateTime time) {
    String year = time.year.toString();
    String month = time.month.toString().padLeft(2, '0');
    String day = time.day.toString().padLeft(2, '0');
    String hour = time.hour.toString().padLeft(2, '0');
    String minute = time.minute.toString().padLeft(2, '0');
    String second = time.second.toString().padLeft(2, '0');

    return '$year/$month/$day $hour:$minute:$second';
  }
}
