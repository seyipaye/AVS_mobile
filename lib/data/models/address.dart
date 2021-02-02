class Address {
//JsonName:geo
  AddressGeo geo;

//JsonName:verifiedOn
  String verifiedOn;

//JsonName:isVerified
  bool isVerified;

//JsonName:streetAddress
  String streetAddress;

//JsonName:lga
  String lga;

//JsonName:postalCode
  String postalCode;

//JsonName:state
  String state;

  final String landmark;

  final String point;

  Address({
    this.geo,
    this.verifiedOn,
    this.isVerified,
    this.streetAddress,
    this.lga,
    this.postalCode,
    this.state,
    this.landmark,
    this.point,
  });

  get toRegisterRequestBody {
    return {
      'address': {
        'streetAddress': streetAddress,
        'lga': lga,
        'postalCode': postalCode,
        'state': state,
      }
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'geo': geo?.toMap(),
      'verifiedOn': verifiedOn,
      'isVerified': isVerified,
      'streetAddress': streetAddress,
      'lga': lga,
      'postalCode': postalCode,
      'state': state,
      'landmark': landmark,
      'point': point,
    };
  }

  factory Address.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return Address(
      geo: AddressGeo.fromMap(map['geo']),
      verifiedOn: map['verifiedOn']?.toString(),
      isVerified: null == (temp = map['isVerified'])
          ? false
          : (temp is bool
              ? temp
              : (temp is num
                  ? 0 != temp.toInt()
                  : ('true' == temp.toString()))),
      streetAddress: map['streetAddress']?.toString(),
      lga: map['lga']?.toString(),
      postalCode: map['postalCode']?.toString(),
      state: map['state']?.toString(),
      landmark: map['landmark']?.toString(),
      point: map['point']?.toString(),
    );
  }
}

class AddressGeo {
//JsonName:coordinates
  List<double> coordinates;

//JsonName:type
  String type;

  AddressGeo({
    this.coordinates,
    this.type,
  });

  get toRegisterRequestBody {
    return {
      'coordinates': coordinates?.map((map) => map)?.toList() ?? [],
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'coordinates': coordinates?.map((map) => map)?.toList() ?? [],
      'type': type,
    };
  }

  factory AddressGeo.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return AddressGeo(
      coordinates: null == (temp = map['coordinates'])
          ? []
          : (temp is List
              ? temp
                  .map((map) => null == map
                      ? null
                      : (map is num ? map.toDouble() : double.tryParse(map)))
                  .toList()
              : []),
      type: map['type']?.toString(),
    );
  }
}
