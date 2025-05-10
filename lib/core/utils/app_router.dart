import 'package:bones_app/features/chat/presentation/view/chat_view.dart';
import 'package:bones_app/features/forget_password/presentation/view/code_verification_view.dart';
import 'package:bones_app/features/forget_password/presentation/view/reset_password_view.dart';
import 'package:bones_app/features/patient_register/presentation/view/patient_register_view.dart';
import 'package:bones_app/features/Specalist_home/presentation/view/specialist_home_view.dart';
import 'package:bones_app/features/consultation/presentation/view/consultation_view.dart';
import 'package:bones_app/features/forget_password/presentation/view/forget_password_view.dart';
import 'package:bones_app/features/get_started/presentation/view/get_started_view.dart';
import 'package:bones_app/features/patent_login/presentation/view/patient_login_view.dart';
import 'package:bones_app/features/patient_home/presentation/view/patient_home_view.dart';
import 'package:bones_app/features/payment/presentation/view/payment_view.dart';
import 'package:bones_app/features/profile/presentation/view/profile_view.dart';
import 'package:bones_app/features/report_generating/presentation/view/report_generating_view.dart';
import 'package:bones_app/features/specalist_login/presentation/view/specalist_login_view.dart';
import 'package:bones_app/features/specalist_register/presentation/view/specalist_register_view.dart';
import 'package:bones_app/features/welcome/presentation/view/welcome_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kWelcomeView = '/welcome';
  static const kGetStartedView = '/getStarted';
  static const kPatientLoginView = '/patientLogin';
  static const kPatientRegisterView = '/patientRegister';
  static const kPatientHomeView = '/patientHome';
  static const kSpecalistLoginView = '/specalistLogin';
  static const kSpecalistRegisterView = '/specalistRegister';
  static const kSpecialistHomeView = '/specialistHome';
  static const kForgetPasswordView = '/forgetPassword';
  static const kCodeVerifyView = '/codeVerify';
  static const kResetPasswordView = '/resetPassword';
  static const kPaymentView = "/payment";
  static const kReportGeneratingView = '/reportGenerating';
  static const kConsultationView = '/consultation';
  static const kChatView = '/chat';
  static const kProfileView = '/profile';

  static final router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => const WelcomeView()),
    GoRoute(
      path: kGetStartedView,
      builder: (context, state) {
        final String userType = state.extra.toString();
        return GetStartedView(
          userType: userType,
        );
      },
    ),
    GoRoute(
        path: kPatientLoginView,
        builder: (context, state) => const PatientLoginView()),
    GoRoute(
        path: kForgetPasswordView,
        builder: (context, state) => const ForgetPasswordView()),
    GoRoute(
        path: kCodeVerifyView,
        builder: (context, state) => const CodeVerificationView()),
    GoRoute(
        path: kResetPasswordView,
        builder: (context, state) => const ResetPasswordView()),
    GoRoute(
      path: kPatientRegisterView,
      builder: (context, state) => const PatientRegisterView(),
    ),
    GoRoute(
        path: kPaymentView, builder: (context, state) => const PaymentView()),
    GoRoute(
        path: kPatientHomeView,
        builder: (context, state) => const PatientHomeView()),
    GoRoute(
        path: kSpecialistHomeView,
        builder: (context, state) => const SpecialistHomeView()),
    GoRoute(
        path: kSpecalistLoginView,
        builder: (context, state) => const SpecalistLoginView()),
    GoRoute(
        path: kSpecalistRegisterView,
        builder: (context, state) => const SpecalistRegisterView()),
    GoRoute(
        path: kReportGeneratingView,
        builder: (context, state) => const ReportGeneratingView()),
    GoRoute(
        path: kConsultationView,
        builder: (context, state) => const ConsultationView()),
    GoRoute(path: kChatView, builder: (context, state) => const ChatView()),
    GoRoute(
        path: kProfileView, builder: (context, state) => const ProfileView()),
  ]);
}
