import 'package:avs/data/models/address.dart';
import 'package:avs/data/models/tokens.dart';
import 'package:equatable/equatable.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
///

class User extends Equatable {
  /// {@macro user}
  const User({
    this.address,
    this.mobile,
    this.id,
    this.imageUrl,
    this.firstName,
    this.lastName,
    this.gender,
    this.otherName,
    this.email,
    this.tokens,
    this.uid,
  });

  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
      'id': id,
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'otherName': otherName,
      'email': email.toJson(),
      'imageUrl': imageUrl,
      'tokens': tokens?.toJson()
    };
  }

  User.fromMap(Map<String, dynamic> json)
      : mobile = json['mobile'],
        id = json['id'],
        uid = json['uid'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        gender = json['gender'],
        otherName = json['otherName'],
        email = UserEmail.fromMap(json['email']),
        imageUrl = json['imageUrl'],
        address = null,
        tokens = Tokens.fromMap(json['tokens']);

  /// The current user's phone number.
  final String mobile;

  ///Tokens

  final String id;

  final String uid;

  //JsonName:firstName
  final String firstName;

//JsonName:lastName
  final String lastName;

//JsonName:gender
  final String gender;

//JsonName:otherName
  final String otherName;

//JsonName:email
  final UserEmail email;

  /// Url for the current user's photo.
  final String imageUrl;

  final Tokens tokens;

  final Address address;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(
    email: UserEmail(address: ''),
    mobile: '',
  );

  static final test = User(
    email: UserEmail(address: ''),
    mobile: '08190629078',
    id: '6012aed347266d001d4577dc',
  );

  @override
  List<Object> get props => [
        email,
        mobile,
        imageUrl,
        firstName,
        lastName,
        gender,
        otherName,
        id,
        tokens,
        address
      ];

  bool get isFullyRegistered => true;

  User copyWith({
    final String mobile,
    final String id,
    final String uid,
    final String firstName,
    final String lastName,
    final String gender,
    final String otherName,
    final UserEmail email,
    final String imageUrl,
    final Tokens tokens,
    final Address address,
  }) {
    return User(
      mobile: mobile ?? this.mobile,
      id: id ?? this.id,
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      otherName: otherName ?? this.otherName,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      tokens: tokens ?? this.tokens,
      address: address ?? this.address,
    );
  }

  get toRegisterRequestBody {
    return {
      'profile': {
        'firstName': firstName,
        'lastName': lastName,
        'otherName': otherName,
        'email': {
          'address': this.email.address,
        },
        'gender': this.gender
      }
    };
  }
}

class UserEmail extends Equatable {
//JsonName:address
  final String address;

  const UserEmail({
    this.address,
  });

  UserEmail.fromMap(Map<String, dynamic> json) : address = json['address'];

  Map<String, dynamic> toJson() {
    return {
      'address': address,
    };
  }

  @override
  List<Object> get props => [address];

  get toRequestBody => {"address": this.address};
}
