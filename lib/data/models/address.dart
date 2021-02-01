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

  factory Address.fromDB(Map<String, dynamic> json) {
    if (null == json) return null;
    return Address(
      geo: AddressGeo.fromDB(json),
      verifiedOn: null,
      isVerified: null,
      streetAddress: json['streetAddress'],
      lga: json['lga'],
      postalCode: json['postalCode'],
      state: json['state'],
      landmark: null,
      point: null,
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

  factory AddressGeo.fromDB(Map<String, dynamic> json) {
    return AddressGeo(
      coordinates: [
        double.parse(json['latitude']),
        double.parse(json['longitude'])
      ],
      type: null,
    );
  }
}
