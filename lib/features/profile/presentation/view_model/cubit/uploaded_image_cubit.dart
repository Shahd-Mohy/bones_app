import 'package:bloc/bloc.dart';
import 'package:bones_app/core/models/retrieved_images_model.dart';
import 'package:bones_app/core/networking/retrieve_images_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'uploaded_image_state.dart';

class UploadedImagesCubit extends Cubit<UploadedImagesState> {
  final GetUploadedImagesService service;

  UploadedImagesCubit(this.service) : super(UploadedImagesInitial());

  void loadImages(String userId) async {
          final prefs = await SharedPreferences.getInstance();

    emit(UploadedImagesLoading());
    try {
      final images = await service.fetchUserImages(userId);
      emit(UploadedImagesLoaded(images));
    } catch (e) {
      emit(UploadedImagesError(e.toString()));
    }
  }
}

