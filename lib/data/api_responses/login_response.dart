import 'package:avs/data/models/tokens.dart';
import 'package:avs/data/models/user.dart';

class LoginResponseUserExtraPostOffice {
//JsonName:lga
  String lga;

//JsonName:state
  String state;

//JsonName:ward
  String ward;

  LoginResponseUserExtraPostOffice({
    this.lga,
    this.state,
    this.ward,
  });

  factory LoginResponseUserExtraPostOffice.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return LoginResponseUserExtraPostOffice(
      lga: map['lga']?.toString(),
      state: map['state']?.toString(),
      ward: map['ward']?.toString(),
    );
  }
}

class LoginResponse {
//JsonName:role
  LoginResponseRole role;

//JsonName:tokens
  Tokens tokens;

//JsonName:message
  String message;

//JsonName:user
  LoginResponseUser user;

  LoginResponse({
    this.role,
    this.tokens,
    this.message,
    this.user,
  });

  User get toSimpleUser => User(
      id: user.extra.id,
      uid: user.extra.uid,
      imageUrl: user.extra.profile.imageUrl,
      firstName: user.extra.profile.firstName,
      lastName: user.extra.profile.lastName,
      otherName: user.extra.profile.otherName,
      gender: user.extra.profile.gender,
      mobile: user.extra.profile.mobile.number,
      email: UserEmail(address: user.extra.profile.email.address),
      tokens: tokens);

  factory LoginResponse.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return LoginResponse(
      role: LoginResponseRole.fromMap(map['role']),
      tokens: Tokens.fromMap(map['tokens']),
      message: map['message']?.toString(),
      user: LoginResponseUser.fromMap(map['user']),
    );
  }
}

class LoginResponseUserExtraAddressGeo {
//JsonName:coordinates
  List<double> coordinates;

//JsonName:type
  String type;

  LoginResponseUserExtraAddressGeo({
    this.coordinates,
    this.type,
  });

  factory LoginResponseUserExtraAddressGeo.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return LoginResponseUserExtraAddressGeo(
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

class LoginResponseUserExtraHistory {
//JsonName:createdAt
  String createdAt;

//JsonName:createdBy
  String createdBy;

//JsonName:_id
  String id;

//JsonName:event
  String event;

//JsonName:value
  String value;

  LoginResponseUserExtraHistory({
    this.createdAt,
    this.createdBy,
    this.id,
    this.event,
    this.value,
  });

  factory LoginResponseUserExtraHistory.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return LoginResponseUserExtraHistory(
      createdAt: map['createdAt']?.toString(),
      createdBy: map['createdBy']?.toString(),
      id: map['_id']?.toString(),
      event: map['event']?.toString(),
      value: map['value']?.toString(),
    );
  }
}

class LoginResponseUserExtraProfile {
//JsonName:firstName
  String firstName;

//JsonName:lastName
  String lastName;

//JsonName:gender
  String gender;

//JsonName:imageUrl
  String imageUrl;

//JsonName:mobile
  LoginResponseUserExtraProfileMobile mobile;

//JsonName:otherName
  String otherName;

//JsonName:email
  LoginResponseUserExtraProfileEmail email;

  LoginResponseUserExtraProfile({
    this.firstName,
    this.lastName,
    this.gender,
    this.imageUrl,
    this.mobile,
    this.otherName,
    this.email,
  });

  factory LoginResponseUserExtraProfile.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return LoginResponseUserExtraProfile(
      firstName: map['firstName']?.toString(),
      lastName: map['lastName']?.toString(),
      gender: map['gender']?.toString(),
      imageUrl: map['imageUrl']?.toString(),
      mobile: LoginResponseUserExtraProfileMobile.fromMap(map['mobile']),
      otherName: map['otherName']?.toString(),
      email: LoginResponseUserExtraProfileEmail.fromMap(map['email']),
    );
  }
}

class LoginResponseRole {
  LoginResponseRole();

  factory LoginResponseRole.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return LoginResponseRole();
  }
}

class LoginResponseUserExtraProfileMobile {
//JsonName:number
  String number;

//JsonName:verifiedOn
  String verifiedOn;

//JsonName:isVerified
  bool isVerified;

  LoginResponseUserExtraProfileMobile({
    this.number,
    this.verifiedOn,
    this.isVerified,
  });

  factory LoginResponseUserExtraProfileMobile.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return LoginResponseUserExtraProfileMobile(
      number: map['number']?.toString(),
      verifiedOn: map['verifiedOn']?.toString(),
      isVerified: null == (temp = map['isVerified'])
          ? false
          : (temp is bool
              ? temp
              : (temp is num
                  ? 0 != temp.toInt()
                  : ('true' == temp.toString()))),
    );
  }
}

class LoginResponseUserExtraAddress {
//JsonName:geo
  LoginResponseUserExtraAddressGeo geo;

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

  LoginResponseUserExtraAddress({
    this.geo,
    this.verifiedOn,
    this.isVerified,
    this.streetAddress,
    this.lga,
    this.postalCode,
    this.state,
  });

  factory LoginResponseUserExtraAddress.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return LoginResponseUserExtraAddress(
      geo: LoginResponseUserExtraAddressGeo.fromMap(map['geo']),
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
    );
  }
}

class LoginResponseUserExtraProfileEmail {
//JsonName:address
  String address;

//JsonName:verifiedOn
  String verifiedOn;

//JsonName:isVerified
  bool isVerified;

  LoginResponseUserExtraProfileEmail({
    this.address,
    this.verifiedOn,
    this.isVerified,
  });

  factory LoginResponseUserExtraProfileEmail.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return LoginResponseUserExtraProfileEmail(
      address: map['address']?.toString(),
      verifiedOn: map['verifiedOn']?.toString(),
      isVerified: null == (temp = map['isVerified'])
          ? false
          : (temp is bool
              ? temp
              : (temp is num
                  ? 0 != temp.toInt()
                  : ('true' == temp.toString()))),
    );
  }
}

class LoginResponseUserExtra {
//JsonName:agentId
  int agentId;

//JsonName:address
  LoginResponseUserExtraAddress address;

//JsonName:profile
  LoginResponseUserExtraProfile profile;

//JsonName:history
  List<LoginResponseUserExtraHistory> history;

//JsonName:type
  String type;

//JsonName:uid
  String uid;

//JsonName:createdAt
  String createdAt;

//JsonName:walletBalance
  int walletBalance;

//JsonName:createdBy
  String createdBy;

//JsonName:ID
  List<dynamic> iD;

//JsonName:id
  String id;

//JsonName:user
  String user;

//JsonName:postOffice
  LoginResponseUserExtraPostOffice postOffice;

//JsonName:status
  String status;

//JsonName:updatedAt
  String updatedAt;

  LoginResponseUserExtra({
    this.agentId,
    this.address,
    this.profile,
    this.history,
    this.type,
    this.uid,
    this.createdAt,
    this.walletBalance,
    this.createdBy,
    this.iD,
    this.id,
    this.user,
    this.postOffice,
    this.status,
    this.updatedAt,
  });

  factory LoginResponseUserExtra.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return LoginResponseUserExtra(
      agentId: null == (temp = map['agentId'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      address: LoginResponseUserExtraAddress.fromMap(map['address']),
      profile: LoginResponseUserExtraProfile.fromMap(map['profile']),
      history: null == (temp = map['history'])
          ? []
          : (temp is List
              ? temp
                  .map((map) => LoginResponseUserExtraHistory.fromMap(map))
                  .toList()
              : []),
      type: map['type']?.toString(),
      uid: map['uid']?.toString(),
      createdAt: map['createdAt']?.toString(),
      walletBalance: null == (temp = map['walletBalance'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      createdBy: map['createdBy']?.toString(),
      iD: null == (temp = map['ID'])
          ? []
          : (temp is List ? temp.map((map) => map).toList() : []),
      id: map['id']?.toString(),
      user: map['user']?.toString(),
      postOffice: LoginResponseUserExtraPostOffice.fromMap(map['postOffice']),
      status: map['status']?.toString(),
      updatedAt: map['updatedAt']?.toString(),
    );
  }
}

class LoginResponseUser {
//JsonName:createdAt
  String createdAt;

//JsonName:extra
  LoginResponseUserExtra extra;

//JsonName:mobile
  String mobile;

//JsonName:authMethods
  List<String> authMethods;

//JsonName:id
  String id;

//JsonName:type
  String type;

//JsonName:email
  String email;

//JsonName:updatedAt
  String updatedAt;

  LoginResponseUser({
    this.createdAt,
    this.extra,
    this.mobile,
    this.authMethods,
    this.id,
    this.type,
    this.email,
    this.updatedAt,
  });

  factory LoginResponseUser.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return LoginResponseUser(
      createdAt: map['createdAt']?.toString(),
      extra: LoginResponseUserExtra.fromMap(map['extra']),
      mobile: map['mobile']?.toString(),
      authMethods: null == (temp = map['authMethods'])
          ? []
          : (temp is List ? temp.map((map) => map?.toString()).toList() : []),
      id: map['id']?.toString(),
      type: map['type']?.toString(),
      email: map['email']?.toString(),
      updatedAt: map['updatedAt']?.toString(),
    );
  }
}
