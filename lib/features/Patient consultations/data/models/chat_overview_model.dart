class ChatOverviewModel {
  final String senderName;
  final String content;
  final String senderId;
  final String receiverId;
  final DateTime sentAt;

  ChatOverviewModel({
    required this.senderName,
    required this.content,
    required this.senderId,
    required this.receiverId,
    required this.sentAt,
  });

  factory ChatOverviewModel.fromJson(Map<String, dynamic> json) {
    return ChatOverviewModel(
      senderName: json['senderName'],
      content: json['content'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      sentAt: DateTime.parse(json['sentAt']),
    );
  }
}
