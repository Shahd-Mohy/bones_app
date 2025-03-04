import 'package:bones_app/features/Register/presentation/view/register_view.dart';
import 'package:bones_app/features/Specalist_home/presentation/view/specialist_home_view.dart';
import 'package:bones_app/features/consultation/presentation/view/consultation_view.dart';
import 'package:bones_app/features/forget_password/presentation/view/forget_password_view.dart';
import 'package:bones_app/features/get_started/presentation/view/get_started_view.dart';
import 'package:bones_app/features/login/presentation/view/login_view.dart';
import 'package:bones_app/features/patient_home/presentation/view/patient_home_view.dart';
import 'package:bones_app/features/payment/presentation/view/payment_view.dart';
import 'package:bones_app/features/report_generating/presentation/view/report_generating_view.dart';
import 'package:bones_app/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kGetStartedView = '/getStarted';
  static const kLoginView = '/login';
  static const kForgetPasswordView = '/forgetPassword';
  static const kRegisterView = '/register';
  static const kPaymentView = "/payment";
  static const kPatientHomeView = '/patientHome';
  static const kSpecialistHomeView = '/specialistHome';
  static const kReportGeneratingView = '/reportGenerating';
  static const kConsultationView = '/consultation';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kGetStartedView,
      builder: (context, state) => const GetStartedView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kForgetPasswordView,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: kRegisterView,
      builder: (context, State) => const RegisterView(),
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
        path: kReportGeneratingView,
        builder: (context, state) => const ReportGeneratingView()),
    GoRoute(
        path: kConsultationView,
        builder: (context, state) => const ConsultationView()),
  ]);
}
