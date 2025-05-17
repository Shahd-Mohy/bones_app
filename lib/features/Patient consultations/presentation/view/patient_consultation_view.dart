import 'package:bones_app/core/networking/chat_service.dart';
import 'package:bones_app/features/Patient%20consultations/presentation/view/widgets/patient_consultation_view_body.dart';
import 'package:bones_app/features/Patient%20consultations/presentation/view_model/cubit/chat_overview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientConsultationView extends StatelessWidget {
  final ChatService chatService;

  const PatientConsultationView({super.key, required this.chatService});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatOverviewCubit(chatService),
      child: const PatientConsultationsBody(),
    );
  }
}
