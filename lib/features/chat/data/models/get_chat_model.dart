class ChatMessageModel {
  final String content;
  final String receiverId;
  final String senderId;
  final String sentAt;

  ChatMessageModel({
    required this.content,
    required this.receiverId,
    required this.senderId,
    required this.sentAt,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      content: json['content'],
      receiverId: json['receiverId'],
      senderId: json['senderId'],
      sentAt: json['sentAt'],
    );
  }
}

class GetChatMessagesResponse {
  final bool success;
  final String message;
  final List<ChatMessageModel> data;

  GetChatMessagesResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetChatMessagesResponse.fromJson(Map<String, dynamic> json) {
    return GetChatMessagesResponse(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((msg) => ChatMessageModel.fromJson(msg))
          .toList(),
    );
  }
}
