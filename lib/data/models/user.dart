import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
///
enum Gender { Female, Male }

class User extends Equatable {
  /// {@macro user}
  const User({
    this.mobile,
    this.id,
    this.photo,
    this.firstName,
    this.lastName,
    this.gender,
    this.otherName,
    this.email,
  });

  /// The current user's phone number.
  final String mobile;

  final String id;

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
  final String photo;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(
    email: UserEmail(address: ''),
    mobile: '',
  );

  static const test = User(
    email: UserEmail(address: ''),
    mobile: '08156655655',
  );

  @override
  List<Object> get props =>
      [email, mobile, photo, firstName, lastName, gender, otherName, id];

  bool get isFullyRegistered => true;

  User copyWith({
    final String mobile,
    final String id,
    final String firstName,
    final String lastName,
    final String gender,
    final String otherName,
    final UserEmail email,
    final String photo,
  }) {
    return User(
      mobile: mobile ?? this.mobile,
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      otherName: otherName ?? this.otherName,
      email: email ?? this.email,
      photo: photo ?? this.photo,
    );
  }

  get toRequestBody {
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

  @override
  List<Object> get props => [address];

  get toRequestBody => {"address": this.address};
}
