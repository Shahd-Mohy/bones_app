part of 'uploaded_image_cubit.dart';

@immutable
abstract class UploadedImagesState {}

class UploadedImagesInitial extends UploadedImagesState {}

class UploadedImagesLoading extends UploadedImagesState {}

class UploadedImagesLoaded extends UploadedImagesState {
  final List<RetrievedImagesModel> images;

  UploadedImagesLoaded(this.images);
}

class UploadedImagesError extends UploadedImagesState {
  final String message;

  UploadedImagesError(this.message);
}

