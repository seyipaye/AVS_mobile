import 'address.dart';

class UserExtra {
  static final test = UserExtra(
    profile: UserExtraProfile(
        mobile: UserExtraProfileMobile(number: '08190629078'),
        email: UserExtraProfileEmail(address: '')),
  );

//JsonName:agentId
  int agentId;

//JsonName:address
  Address address;

//JsonName:profile
  UserExtraProfile profile;

//JsonName:history
  List<UserExtraHistory> history;

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
  UserExtraPostOffice postOffice;

//JsonName:status
  String status;

//JsonName:updatedAt
  String updatedAt;

  UserExtra({
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

  Map<String, dynamic> toMap() {
    return {
      'agentId': agentId,
      'address': address?.toMap(),
      'profile': profile?.toMap(),
      'history': history?.map((map) => map?.toMap())?.toList() ?? [],
      'type': type,
      'uid': uid,
      'createdAt': createdAt,
      'walletBalance': walletBalance,
      'createdBy': createdBy,
      'ID': iD?.map((map) => map?.toMap())?.toList() ?? [],
      'id': id,
      'user': user,
      'postOffice': postOffice?.toMap(),
      'status': status,
      'updatedAt': updatedAt,
    };
  }

  factory UserExtra.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserExtra(
      agentId: null == (temp = map['agentId'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      address: Address.fromMap(map['address']),
      profile: UserExtraProfile.fromMap(map['profile']),
      history: null == (temp = map['history'])
          ? []
          : (temp is List
              ? temp.map((map) => UserExtraHistory.fromMap(map)).toList()
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
      postOffice: UserExtraPostOffice.fromMap(map['postOffice']),
      status: map['status']?.toString(),
      updatedAt: map['updatedAt']?.toString(),
    );
  }
}

class UserExtraHistory {
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

  UserExtraHistory({
    this.createdAt,
    this.createdBy,
    this.id,
    this.event,
    this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'createdBy': createdBy,
      '_id': id,
      'event': event,
      'value': value,
    };
  }

  factory UserExtraHistory.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserExtraHistory(
      createdAt: map['createdAt']?.toString(),
      createdBy: map['createdBy']?.toString(),
      id: map['_id']?.toString(),
      event: map['event']?.toString(),
      value: map['value']?.toString(),
    );
  }
}

class UserExtraPostOffice {
//JsonName:lga
  String lga;

//JsonName:state
  String state;

//JsonName:ward
  String ward;

  UserExtraPostOffice({
    this.lga,
    this.state,
    this.ward,
  });

  Map<String, dynamic> toMap() {
    return {
      'lga': lga,
      'state': state,
      'ward': ward,
    };
  }

  factory UserExtraPostOffice.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserExtraPostOffice(
      lga: map['lga']?.toString(),
      state: map['state']?.toString(),
      ward: map['ward']?.toString(),
    );
  }
}

class UserExtraProfile {
//JsonName:firstName
  String firstName;

//JsonName:lastName
  String lastName;

//JsonName:gender
  String gender;

//JsonName:imageUrl
  String imageUrl;

//JsonName:mobile
  UserExtraProfileMobile mobile;

//JsonName:otherName
  String otherName;

//JsonName:email
  UserExtraProfileEmail email;

  UserExtraProfile({
    this.firstName,
    this.lastName,
    this.gender,
    this.imageUrl,
    this.mobile,
    this.otherName,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'imageUrl': imageUrl,
      'mobile': mobile?.toMap(),
      'otherName': otherName,
      'email': email?.toMap(),
    };
  }

  factory UserExtraProfile.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserExtraProfile(
      firstName: map['firstName']?.toString(),
      lastName: map['lastName']?.toString(),
      gender: map['gender']?.toString(),
      imageUrl: map['imageUrl']?.toString(),
      mobile: UserExtraProfileMobile.fromMap(map['mobile']),
      otherName: map['otherName']?.toString(),
      email: UserExtraProfileEmail.fromMap(map['email']),
    );
  }
}

class UserExtraProfileMobile {
//JsonName:number
  String number;

//JsonName:verifiedOn
  String verifiedOn;

//JsonName:isVerified
  bool isVerified;

  UserExtraProfileMobile({
    this.number,
    this.verifiedOn,
    this.isVerified,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'verifiedOn': verifiedOn,
      'isVerified': isVerified,
    };
  }

  factory UserExtraProfileMobile.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserExtraProfileMobile(
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

class UserExtraProfileEmail {
//JsonName:address
  String address;

//JsonName:verifiedOn
  String verifiedOn;

//JsonName:isVerified
  bool isVerified;

  UserExtraProfileEmail({
    this.address,
    this.verifiedOn,
    this.isVerified,
  });

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'verifiedOn': verifiedOn,
      'isVerified': isVerified,
    };
  }

  factory UserExtraProfileEmail.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return UserExtraProfileEmail(
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
