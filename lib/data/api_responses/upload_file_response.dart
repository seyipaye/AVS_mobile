import 'package:equatable/equatable.dart';

class UploadFileResponse extends Equatable {
//JsonName:imageUrls
  final List<String> imageUrls;

//JsonName:message
  final String message;

  UploadFileResponse({
    this.imageUrls,
    this.message,
  });

  factory UploadFileResponse.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UploadFileResponse(
      imageUrls: null == (temp = map['imageUrls'])
          ? []
          : (temp is List ? temp.map((map) => map?.toString()).toList() : []),
      message: map['message']?.toString(),
    );
  }

  @override
  List<Object> get props => [message, imageUrls];
}
