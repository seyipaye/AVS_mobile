class Request {
  final Contact contact;
  final Address address;
  final Report report;
  final String status;
  final String verificationNumber;
  final String createdBy;
  final String merchant;
  final List<dynamic> history;
  final String updatedAt;
  final String requestId;
  final String id;

  Request(
      this.contact,
      this.address,
      this.report,
      this.status,
      this.verificationNumber,
      this.createdBy,
      this.merchant,
      this.history,
      this.updatedAt,
      this.requestId,
      this.id);

  Request.fromJson(Map<String, dynamic> json)
      : contact = Contact.fromJson(json['contact']),
        address = Address.fromJson(json['address']),
        report = Report.fromJson(json['report']),
        status = json['status'],
        verificationNumber = json['verificationNumber'],
        createdBy = json['createdBy'],
        merchant = json['merchant'],
        history = json['history'],
        updatedAt = json['updatedAt'],
        requestId = json['requestId'],
        id = json['id'];
}

class Contact {
  final String createdAt;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String gender;
  final String description;

  Contact(this.createdAt, this.firstName, this.lastName, this.phoneNumber,
      this.email, this.gender, this.description);

  Contact.fromJson(Map<String, dynamic> json)
      : createdAt = json['createdAt'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        phoneNumber = json['phoneNumber'],
        email = json['email'],
        gender = json['gender'],
        description = json['description'];
}

class Address {
  final String state;
  final String lga;
  final String postalCode;
  final String streetAddress;
  final String landmark;
  final Geo geo;
  final String point;

  Address(this.state, this.lga, this.postalCode, this.streetAddress,
      this.landmark, this.geo, this.point);

  Address.fromJson(Map<String, dynamic> json)
      : state = json['state'],
        lga = json['lga'],
        postalCode = json['postalCode'],
        streetAddress = json['streetAddress'],
        landmark = json['landmark'],
        geo = Geo.fromJson(json['geo']),
        point = json['point'];
}

class Report {
  final List<dynamic> notes;
  final List<dynamic> images;
  final List<dynamic> extra;

  Report(this.notes, this.images, this.extra);

  Report.fromJson(Map<String, dynamic> json)
      : notes = json['notes'],
        images = json['images'],
        extra = json['extra'];
}

class Geo {
  final List<dynamic> coordinates;

  Geo(this.coordinates);

  Geo.fromJson(Map<String, dynamic> json) : coordinates = json['coordinates'];
}
