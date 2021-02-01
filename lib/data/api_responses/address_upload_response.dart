import 'package:avs/data/models/address.dart';
import 'package:avs/data/models/tokens.dart';

class AddressUploadResponseAgentProfile {
//JsonName:firstName
  String firstName;

//JsonName:lastName
  String lastName;

//JsonName:gender
  String gender;

//JsonName:imageUrl
  String imageUrl;

//JsonName:mobile
  AddressUploadResponseAgentProfileMobile mobile;

//JsonName:otherName
  String otherName;

//JsonName:email
  AddressUploadResponseAgentProfileEmail email;

  AddressUploadResponseAgentProfile({
    this.firstName,
    this.lastName,
    this.gender,
    this.imageUrl,
    this.mobile,
    this.otherName,
    this.email,
  });

  factory AddressUploadResponseAgentProfile.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return AddressUploadResponseAgentProfile(
      firstName: map['firstName']?.toString(),
      lastName: map['lastName']?.toString(),
      gender: map['gender']?.toString(),
      imageUrl: map['imageUrl']?.toString(),
      mobile: AddressUploadResponseAgentProfileMobile.fromMap(map['mobile']),
      otherName: map['otherName']?.toString(),
      email: AddressUploadResponseAgentProfileEmail.fromMap(map['email']),
    );
  }
}

class AddressUploadResponseAgentProfileEmail {
//JsonName:address
  String address;

//JsonName:isVerified
  bool isVerified;

  AddressUploadResponseAgentProfileEmail({
    this.address,
    this.isVerified,
  });

  factory AddressUploadResponseAgentProfileEmail.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return AddressUploadResponseAgentProfileEmail(
      address: map['address']?.toString(),
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

class AddressUploadResponseAgentProfileMobile {
//JsonName:number
  String number;

//JsonName:verifiedOn
  String verifiedOn;

//JsonName:isVerified
  bool isVerified;

  AddressUploadResponseAgentProfileMobile({
    this.number,
    this.verifiedOn,
    this.isVerified,
  });

  factory AddressUploadResponseAgentProfileMobile.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return AddressUploadResponseAgentProfileMobile(
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

class AddressUploadResponse {
//JsonName:agent
  Agent_UserExtra agent;

//JsonName:tokens
  Tokens tokens;

//JsonName:message
  String message;

  AddressUploadResponse({
    this.agent,
    this.tokens,
    this.message,
  });

  factory AddressUploadResponse.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return AddressUploadResponse(
      agent: Agent_UserExtra.fromMap(map['agent']),
      tokens: Tokens.fromMap(map['tokens']),
      message: map['message']?.toString(),
    );
  }
}

class AddressUploadResponseAgentID {
//JsonName:number
  int number;

//JsonName:_id
  String id;

//JsonName:type
  String type;

  AddressUploadResponseAgentID({
    this.number,
    this.id,
    this.type,
  });

  factory AddressUploadResponseAgentID.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return AddressUploadResponseAgentID(
      number: null == (temp = map['number'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      id: map['_id']?.toString(),
      type: map['type']?.toString(),
    );
  }
}

// ignore: camel_case_types
class Agent_UserExtra {
//JsonName:agentId
  int agentId;

//JsonName:address
  Address address;

//JsonName:profile
  AddressUploadResponseAgentProfile profile;

//JsonName:history
  List<dynamic> history;

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
  List<AddressUploadResponseAgentID> iD;

//JsonName:id
  String id;

//JsonName:user
  String user;

//JsonName:status
  String status;

//JsonName:updatedAt
  String updatedAt;

  Agent_UserExtra({
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
    this.status,
    this.updatedAt,
  });

  factory Agent_UserExtra.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return Agent_UserExtra(
      agentId: null == (temp = map['agentId'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      address: Address.fromMap(map['address']),
      profile: AddressUploadResponseAgentProfile.fromMap(map['profile']),
      history: null == (temp = map['history'])
          ? []
          : (temp is List ? temp.map((map) => map).toList() : []),
      type: map['type']?.toString(),
      uid: map['uid']?.toString(),
      createdAt: map['createdAt']?.toString(),
      walletBalance: null == (temp = map['walletBalance'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      createdBy: map['createdBy']?.toString(),
      iD: null == (temp = map['ID'])
          ? []
          : (temp is List
              ? temp
                  .map((map) => AddressUploadResponseAgentID.fromMap(map))
                  .toList()
              : []),
      id: map['id']?.toString(),
      user: map['user']?.toString(),
      status: map['status']?.toString(),
      updatedAt: map['updatedAt']?.toString(),
    );
  }
}
