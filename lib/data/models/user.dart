import 'package:avs/data/models/address.dart';
import 'package:avs/data/models/tokens.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
      mobile: '08190629074',
      id: '6012aed347266d001d4577dc',
      tokens: Tokens(
          access: LoginResponseTokensAccess(
              token:
                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDEyYWVkMzQ3MjY2ZDAwMWQ0NTc3ZGMiLCJ1c2VyIjp7ImF1dGhNZXRob2RzIjpbIkxPQ0FMIl0sIm1vYmlsZSI6IjA4MTUyNjQyNTMzMyIsInR5cGUiOiJBR0VOVCIsImNyZWF0ZWRBdCI6IjIwMjEtMDEtMjhUMTI6MzI6MTkuODMyWiIsInVwZGF0ZWRBdCI6IjIwMjEtMDEtMjhUMTI6MzI6MjcuODYzWiIsImVtYWlsIjoib21vdG9sZ3NkdWVqakBnbWFpbC5jb20iLCJpZCI6IjYwMTJhZWQzNDcyNjZkMDAxZDQ1NzdkYyIsImV4dHJhIjp7InByb2ZpbGUiOnsiZW1haWwiOnsiaXNWZXJpZmllZCI6ZmFsc2UsImFkZHJlc3MiOiJvbW90b2xnc2R1ZWpqQGdtYWlsLmNvbSJ9LCJtb2JpbGUiOnsiaXNWZXJpZmllZCI6dHJ1ZSwibnVtYmVyIjoiMDgxNTI2NDI1MzMzIiwidmVyaWZpZWRPbiI6IjIwMjEtMDEtMjhUMTI6MzI6MjcuODcxWiJ9LCJmaXJzdE5hbWUiOiJUb2xhbmkiLCJsYXN0TmFtZSI6Ill1bnVzIiwib3RoZXJOYW1lIjoiRHVwc3kiLCJnZW5kZXIiOiJmZW1hbGUifSwiYWRkcmVzcyI6eyJpc1ZlcmlmaWVkIjp0cnVlLCJzdGF0ZSI6IkxhZ29zIiwibGdhIjoiRXRpLW9zYSIsInBvc3RhbENvZGUiOiIxMDEyMjIiLCJzdHJlZXRBZGRyZXNzIjoiMjYxIEV0aW0gSW55YW5nIENyZXNjZW50LCBWaWN0b3JpYSBJc2xhbmQiLCJnZW8iOnsiY29vcmRpbmF0ZXMiOlszLjQzNjA4MjIsNi40MzMyNTUzXSwidHlwZSI6IlBvaW50In0sInZlcmlmaWVkT24iOiIyMDIxLTAxLTI4VDEzOjAyOjI2Ljk4N1oifSwic3RhdHVzIjoiUEVORElORyIsInR5cGUiOiJJTkRfQUdFTlQiLCJ3YWxsZXRCYWxhbmNlIjowLCJyYXRpbmciOjAsInRvdGFsQXNzaWduZWRSZXF1ZXN0cyI6MCwidXNlciI6IjYwMTJhZWQzNDcyNjZkMDAxZDQ1NzdkYyIsImNyZWF0ZWRCeSI6IjYwMTJhZWQzNDcyNjZkMDAxZDQ1NzdkYyIsImhpc3RvcnkiOltdLCJJRCI6W10sInJlcXVlc3RzUmVqZWN0ZWQiOltdLCJjcmVhdGVkQXQiOiIyMDIxLTAxLTI4VDEyOjMyOjI3Ljg3NloiLCJ1cGRhdGVkQXQiOiIyMDIxLTAxLTI4VDEzOjAyOjI2Ljk4OVoiLCJhZ2VudElkIjoyMSwiaWQiOiI2MDEyYWVkYjQ3MjY2ZDAwMWQ0NTc3ZGQifX0sImlhdCI6MTYxMTgzOTM2OSwiZXhwIjoxNjExODQxMTY5fQ.IgZXZS9cIljWpXqQEpKk75wSoJta9r8IlTFG31m75vA'),
          refresh: LoginResponseTokensRefresh(
              token:
                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDEyNzgwNmMyMjBiNzAwMWRlNzVlYjkiLCJ1c2VyIjp7ImF1dGhNZXRob2RzIjpbIkxPQ0FMIl0sIm1vYmlsZSI6IjA4MTUyNjI1MzMzIiwidHlwZSI6IkFHRU5UIiwiY3JlYXRlZEF0IjoiMjAyMS0wMS0yOFQwODozODozMC44ODNaIiwidXBkYXRlZEF0IjoiMjAyMS0wMS0yOFQwODozODo0MS4xMTZaIiwiZW1haWwiOiJvbW90b2xnc2R1ZWpqQGdtYWlsLmNvbSIsImlkIjoiNjAxMjc4MDZjMjIwYjcwMDFkZTc1ZWI5In0sImlhdCI6MTYxMTgyMzE0NCwiZXhwIjoxNjE0NDE1MTQ0fQ._aDuPicTL1IZdq6iohGKri16J1ZSQmaDdaaxmWKwxiQ')));

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
