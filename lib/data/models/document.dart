enum DocumentType { INTERNATIONAL_PASSPORT, DRIVERS_LICENSE, VOTER_CARD, NIN }

class Document {
  final String title;
  final String value;
  final DocumentType type;
  final String label;

  const Document({this.title, this.value, this.type, this.label});

  Document copyWith({
    final String title,
    final String value,
    final DocumentType type,
    final String label,
  }) {
    return Document(
      title: title ?? this.title,
      value: value ?? this.value,
      type: type ?? this.type,
      label: label ?? this.label,
    );
  }
}
