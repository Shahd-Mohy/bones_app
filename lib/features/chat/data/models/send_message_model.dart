class SendMessageRequest {
  final String content;
  final String receiverId;
  final DateTime sentAt;

  SendMessageRequest({
    required this.content,
    required this.receiverId,
    required this.sentAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'receiverId': receiverId,
      'sentAt': sentAt.toIso8601String(),
    };
  }
}

class SendMessageResponse {
  final bool success;
  final String message;

  SendMessageResponse({required this.success, required this.message});

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendMessageResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}
