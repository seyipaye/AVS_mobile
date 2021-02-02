import 'package:avs/data/models/tokens.dart';
import 'package:avs/data/models/user.dart';
import 'package:avs/data/models/user_extra.dart';

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
    return LoginResponse(
      role: LoginResponseRole.fromMap(map['role']),
      tokens: Tokens.fromMap(map['tokens']),
      message: map['message']?.toString(),
      user: LoginResponseUser.fromMap(map['user']),
    );
  }
}

class LoginResponseRole {
  LoginResponseRole();

  factory LoginResponseRole.fromMap(dynamic map) {
    if (null == map) return null;
    return LoginResponseRole();
  }
}

class LoginResponseUser {
//JsonName:createdAt
  String createdAt;

//JsonName:extra
  UserExtra extra;

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
      extra: UserExtra.fromMap(map['extra']),
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
