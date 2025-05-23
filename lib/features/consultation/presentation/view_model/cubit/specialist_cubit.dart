import 'package:bloc/bloc.dart';
import 'package:bones_app/features/consultation/data/models/specialist_model.dart';
import 'package:bones_app/features/consultation/data/repos/specialist_repo.dart';
import 'package:meta/meta.dart';

part 'specialist_state.dart';

class SpecialistCubit extends Cubit<SpecialistState> {
  final SpecialistRepo specialistRepo;
  List<SpecialistModel> _allSpecialists = [];

  SpecialistCubit(this.specialistRepo) : super(SpecialistInitial());

  Future<void> fetchAllSpecialists() async {
    emit(SpecialistLoading());
    final result = await specialistRepo.fetchAllSpecialists();
    result.fold(
      (failure) => emit(SpecialistFailed(failure.errMessage)),
      (specialists) {
        _allSpecialists = specialists;
        emit(SpecialistSuccess(_allSpecialists));
      },
    );
  }

  void searchSpecialists(String query) {
    if (query.isEmpty) {
      emit(SpecialistSuccess(_allSpecialists));
    } else {
      final filtered = _allSpecialists.where((specialist) {
        final lower = query.toLowerCase();
        return specialist.name.toLowerCase().contains(lower) ||
            specialist.email.toLowerCase().contains(lower);
      }).toList();
      emit(SpecialistSuccess(filtered));
    }
  }
}
