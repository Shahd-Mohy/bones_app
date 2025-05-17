import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/Patient%20consultations/presentation/view_model/cubit/chat_overview_cubit.dart';
import 'package:bones_app/features/Patient%20consultations/presentation/view/widgets/patient_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientConsultationsBody extends StatefulWidget {
  const PatientConsultationsBody({super.key});

  @override
  State<PatientConsultationsBody> createState() =>
      _PatientConsultationsBodyState();
}

class _PatientConsultationsBodyState extends State<PatientConsultationsBody> {
  late String userId;

  @override
  void initState() {
    super.initState();
    _loadUserIdAndFetch();
  }

  Future<void> _loadUserIdAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userStringId') ?? '';
    if (userId.isNotEmpty) {
      context.read<ChatOverviewCubit>().fetchChatOverviews();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Previous Consultations',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ChatOverviewCubit, ChatOverviewState>(
        builder: (context, state) {
          if (state is ChatOverviewLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChatOverviewError) {
            return Center(child: Text(state.message));
          } else if (state is ChatOverviewLoaded) {
            final chats = state.chats;

            if (chats.isEmpty) {
              return const Center(child: Text("No previous chats found."));
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];

                  final isMeSender = chat.senderId == userId;
                  final otherId = isMeSender ? chat.receiverId : chat.senderId;
                  final displayName = chat.senderName;
                  final displayEmail = chat.senderName;

                  return PatientCard(
                    name: displayName,
                    email: displayEmail,
                    userId: otherId,
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
