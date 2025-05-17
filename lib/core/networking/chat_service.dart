import 'package:bones_app/core/utils/shared_prefs_helper.dart';
import 'package:bones_app/features/Patient%20consultations/data/models/chat_overview_model.dart';
import 'package:bones_app/features/chat/data/models/get_chat_model.dart';
import 'package:bones_app/features/chat/data/models/send_message_model.dart';
import 'package:dio/dio.dart';

class ChatService {
  final Dio dio;

  ChatService({required this.dio});

  Future<GetChatMessagesResponse?> fetchChatMessages(String receiverId) async {
    try {
      final token = await SharedPrefsHelper.getToken();
      if (token == null) throw Exception("Token is missing");

      final response = await dio.get(
        'https://bones.runasp.net/api/Chat/GetChat',
        queryParameters: {'ReceiverId': receiverId},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'accept': '*/*',
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetChatMessagesResponse.fromJson(response.data);
      } else {
        throw Exception('No Messages Yet');
      }
    } catch (e) {
      print('ChatService Error: $e');
      return null;
    }
  }

  Future<SendMessageResponse?> sendMessage(SendMessageRequest request) async {
    try {
      final token = await SharedPrefsHelper.getToken();
      if (token == null) throw Exception("Token is missing");

      final response = await dio.post(
        'https://bones.runasp.net/api/Chat/SendMessage',
        data: request.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'accept': '*/*',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return SendMessageResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to send message');
      }
    } catch (e) {
      print('SendMessage Error: $e');
      return null;
    }
  }

  Future<List<ChatOverviewModel>> getAllMessages() async {
    try {
      final token = await SharedPrefsHelper.getToken();
      if (token == null) throw Exception("Token is missing");

      final response = await dio.get(
        'https://bones.runasp.net/api/Chat/GetAllMessages',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'accept': '*/*',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> data = response.data['data'];
        return data.map((e) => ChatOverviewModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('getAllMessages Error: $e');
      return [];
    }
  }
}
