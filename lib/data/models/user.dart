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
    this.email,
    this.mobile,
    this.name,
    this.photo,
  });

  /// The current user's email address.
  final String email;

  /// The current user's phone number.
  final String mobile;

  /// The current user's name (display name).
  final String name;

  /// Url for the current user's photo.
  final String photo;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(email: '', mobile: '', name: null, photo: null);

  @override
  List<Object> get props => [email, mobile, name, photo];

  bool get isFullyRegistered => true;
}
