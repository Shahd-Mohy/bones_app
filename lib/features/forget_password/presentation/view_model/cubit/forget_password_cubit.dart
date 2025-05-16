import 'package:bloc/bloc.dart';
import 'package:bones_app/features/forget_password/data/repos/forget_password_repo_impl.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo repo;

  ForgetPasswordCubit(this.repo) : super(ForgetPasswordInitial());

  Future<void> sendCode(String email) async {
    emit(ForgetPasswordLoading());
    try {
      final response = await repo.sendForgetPasswordEmail(email);
      final success = response['success'] ?? false;
      final message = response['message'] ?? 'Unknown error';

      if (response['success'] == true) {
        emit(ForgetPasswordSuccess(message: message));
      } else {
        emit(ForgetPasswordFailure(
            error: response['message'] ?? 'Unknown error'));
      }
    } catch (e) {
      emit(ForgetPasswordFailure(
          error: "Please enter a valid email or try again later."));
    }
  }
}
