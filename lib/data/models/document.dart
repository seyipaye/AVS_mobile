import 'package:equatable/equatable.dart';

enum DocumentType {
  INTERNATIONAL_PASSPORT,
  DRIVERS_LICENSE,
  VOTERS_CARD,
  NIN,
  PHOTO
}

class Document {
  final String title;
  final String value;
  final DocumentType type;
  final String label;
  final String url;
  final String backendType;

  const Document(
      {this.backendType,
      this.url,
      this.title,
      this.value,
      this.type,
      this.label});

  Document copyWith({
    final String title,
    final String value,
    final DocumentType type,
    final String label,
    final String url,
    final String backendTitle,
  }) {
    return Document(
      title: title ?? this.title,
      value: value ?? this.value,
      type: type ?? this.type,
      label: label ?? this.label,
      url: url ?? this.url,
      backendType: backendTitle ?? this.backendType,
    );
  }
}
