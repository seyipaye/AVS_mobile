import 'package:avs/data/models/document.dart';

class FailedVerificationUpload {
  final String id;
  final String reasons;
  final String latitude;
  final String longitude;
  final String assessment;
  final String documentPath;

  FailedVerificationUpload(
      {this.id,
      this.reasons,
      this.latitude,
      this.longitude,
      this.assessment,
      this.documentPath});

  Map<String, dynamic> toJson() {
    return {
      id: id,
      reasons: reasons,
      latitude: latitude,
      longitude: longitude,
      assessment: assessment,
      documentPath: documentPath
    };
  }

  FailedVerificationUpload.fromDb(
    Map<String, dynamic> json,
  )   : id = json['id'],
        reasons = json['reasons'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        documentPath = json['documentPath'],
        assessment = json['assessment'];
}
