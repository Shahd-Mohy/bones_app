part of 'image_report_cubit.dart';

@immutable
sealed class ImageReportState {}

class ImageReportInitial extends ImageReportState {}

class ImageReportLoading extends ImageReportState {}

class ImageReportLoaded extends ImageReportState {
  final ImageReportModel report;

  ImageReportLoaded(this.report);
}

class ImageReportError extends ImageReportState {
  final String message;

  ImageReportError(this.message);
}