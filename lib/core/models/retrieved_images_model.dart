class RetrievedImagesModel {
  final int id;
  final String imageUrl;
  final String uploadedAt;

  RetrievedImagesModel({
    required this.id,
    required this.imageUrl,
    required this.uploadedAt,
  });

  factory RetrievedImagesModel.fromJson(Map<String, dynamic> json) {
    return RetrievedImagesModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      uploadedAt: json['uploadedAt'],
    );
  }
}
