class GroupChat {
  final String id;
  final String sender;
  final String message;
  final String createdAt;
  final dynamic timeStamp;

  GroupChat({
    required this.id,
    required this.sender,
    required this.message,
    required this.createdAt,
    required this.timeStamp,
  });

  factory GroupChat.fromMap(Map<Object?, Object?> map) {
    return GroupChat(
      id: map['id'] as String,
      message: map['message'] as String,
      createdAt: map['createdAt'] as String,
      sender: map['sender'] as String,
      timeStamp: map['timeStamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sender': sender,
      'message': message,
      'createdAt': createdAt,
      'timeStamp': timeStamp,
    };
  }
}
