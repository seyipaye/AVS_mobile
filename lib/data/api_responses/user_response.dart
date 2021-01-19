import 'package:avs/data/models/user.dart';

class UserResponse {
//JsonName:agent
  UserResponseAgent agent;

//JsonName:message
  String message;

  UserResponse({
    this.agent,
    this.message,
  });

  User get toSimpleUser => User(
        mobile: agent.profile.mobile.number,
        id: agent.user,
        imageUrl: null,
        firstName: agent.profile.firstName,
        lastName: agent.profile.lastName,
        gender: agent.profile.gender,
        otherName: agent.profile.otherName,
        email: UserEmail(address: agent.profile.email.address),
      );

  factory UserResponse.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserResponse(
      agent: UserResponseAgent.fromMap(map['agent']),
      message: map['message']?.toString(),
    );
  }
}

class UserResponseAgent {
//JsonName:agentId
  int agentId;

//JsonName:address
  UserResponseAgentAddress address;

//JsonName:profile
  UserResponseAgentProfile profile;

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
  UserResponseAgentCreatedBy createdBy;

//JsonName:ID
  List<dynamic> iD;

//JsonName:id
  String id;

//JsonName:user
  String user;

//JsonName:status
  String status;

//JsonName:updatedAt
  String updatedAt;

  UserResponseAgent({
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

  factory UserResponseAgent.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserResponseAgent(
      agentId: null == (temp = map['agentId'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      address: UserResponseAgentAddress.fromMap(map['address']),
      profile: UserResponseAgentProfile.fromMap(map['profile']),
      history: null == (temp = map['history'])
          ? []
          : (temp is List ? temp.map((map) => map).toList() : []),
      type: map['type']?.toString(),
      uid: map['uid']?.toString(),
      createdAt: map['createdAt']?.toString(),
      walletBalance: null == (temp = map['walletBalance'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      createdBy: UserResponseAgentCreatedBy.fromMap(map['createdBy']),
      iD: null == (temp = map['ID'])
          ? []
          : (temp is List ? temp.map((map) => map).toList() : []),
      id: map['id']?.toString(),
      user: map['user']?.toString(),
      status: map['status']?.toString(),
      updatedAt: map['updatedAt']?.toString(),
    );
  }
}

class UserResponseAgentAddress {
//JsonName:isVerified
  bool isVerified;

  UserResponseAgentAddress({
    this.isVerified,
  });

  factory UserResponseAgentAddress.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserResponseAgentAddress(
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

class UserResponseAgentProfile {
//JsonName:firstName
  String firstName;

//JsonName:lastName
  String lastName;

//JsonName:gender
  String gender;

//JsonName:mobile
  UserResponseAgentProfileMobile mobile;

//JsonName:otherName
  String otherName;

//JsonName:email
  UserResponseAgentProfileEmail email;

  UserResponseAgentProfile({
    this.firstName,
    this.lastName,
    this.gender,
    this.mobile,
    this.otherName,
    this.email,
  });

  factory UserResponseAgentProfile.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserResponseAgentProfile(
      firstName: map['firstName']?.toString(),
      lastName: map['lastName']?.toString(),
      gender: map['gender']?.toString(),
      mobile: UserResponseAgentProfileMobile.fromMap(map['mobile']),
      otherName: map['otherName']?.toString(),
      email: UserResponseAgentProfileEmail.fromMap(map['email']),
    );
  }
}

class UserResponseAgentProfileMobile {
//JsonName:number
  String number;

//JsonName:verifiedOn
  String verifiedOn;

//JsonName:isVerified
  bool isVerified;

  UserResponseAgentProfileMobile({
    this.number,
    this.verifiedOn,
    this.isVerified,
  });

  factory UserResponseAgentProfileMobile.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserResponseAgentProfileMobile(
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

class UserResponseAgentProfileEmail {
//JsonName:address
  String address;

//JsonName:isVerified
  bool isVerified;

  UserResponseAgentProfileEmail({
    this.address,
    this.isVerified,
  });

  factory UserResponseAgentProfileEmail.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserResponseAgentProfileEmail(
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

class UserResponseAgentCreatedBy {
//JsonName:createdAt
  String createdAt;

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

  UserResponseAgentCreatedBy({
    this.createdAt,
    this.mobile,
    this.authMethods,
    this.id,
    this.type,
    this.email,
    this.updatedAt,
  });

  factory UserResponseAgentCreatedBy.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserResponseAgentCreatedBy(
      createdAt: map['createdAt']?.toString(),
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
