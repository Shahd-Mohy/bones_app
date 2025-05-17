import 'package:bones_app/constants.dart';
import 'package:bones_app/core/networking/chat_service.dart';
import 'package:bones_app/core/networking/dio_client.dart';
import 'package:bones_app/features/chat/presentation/view/chat_view.dart';
import 'package:bones_app/features/chat/presentation/view_model/cubit/chat_cubit.dart';
import 'package:bones_app/features/consultation/presentation/view/widgets/custom_message_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class PatientCard extends StatelessWidget {
  const PatientCard(
      {super.key,
      required this.name,
      required this.email,
      required this.userId});
  final String name;
  final String email;
  final String userId;

  @override
  Widget build(BuildContext context) {
    const width = double.infinity;
    final heigth = MediaQuery.of(context).size.height * 0.15;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Container(
            width: width,
            height: heigth,
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: Lottie.asset(
                    "assets/animations/patientAvatar.json",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          CustomMessageButton(
              title: "Reply",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (context) => ChatCubit(
                        ChatService(dio: DioClient.createDio()),
                      )..fetchChatMessages(userId),
                      child: ChatView(
                        receiverId: userId,
                        doctorName: name,
                      ),
                    ),
                  ),
                );
              }),
          Divider(
              color: Colors.grey[300],
              thickness: 1,
              height: 15,
              indent: 10,
              endIndent: 20)
        ],
      ),
    );
  }
}
