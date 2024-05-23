import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {required this.sender,
      required this.text,
      required this.isMe,
      required this.time});

  final String sender;
  final String text;
  final bool isMe;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0))
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
            elevation: 5.0,
            color: isMe
                ? const Color(0xffF43C3E)
                : const Color(0xffF43C3E).withOpacity(0.8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sender,
                    style: isMe
                        ? const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                          )
                        : const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2, horizontal: 20.0),
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                time.toString(),
                style: const TextStyle(fontSize: 8, color: Colors.blueGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
