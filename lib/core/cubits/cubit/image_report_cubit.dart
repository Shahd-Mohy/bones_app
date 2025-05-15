import 'package:bloc/bloc.dart';
import 'package:bones_app/core/models/image_report_model.dart';
import 'package:bones_app/core/networking/get_report_service.dart';
import 'package:meta/meta.dart';

part 'image_report_state.dart';

class ImageReportCubit extends Cubit<ImageReportState> {
  final ImageReportService service;

  ImageReportCubit(this.service) : super(ImageReportInitial());

  Future<void> fetchReport(String id) async {
    emit(ImageReportLoading());
    try {
      final report = await service.getImageReportById(id);
      emit(ImageReportLoaded(report));
    } catch (e) {
      emit(ImageReportError(e.toString()));
    }
  }
}
