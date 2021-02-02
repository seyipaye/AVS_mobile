import 'package:avs/data/models/user.dart';
import 'package:avs/data/models/user_extra.dart';

class RegistrationResponse {
//JsonName:agent
  UserExtra agent;

//JsonName:message
  String message;

  RegistrationResponse({
    this.agent,
    this.message,
  });

  User get toSimpleUser {
    print(agent.user);
    print(agent.id);
    return User(
      mobile: agent.profile.mobile.number,
      id: agent.user,
      imageUrl: null,
      firstName: agent.profile.firstName,
      lastName: agent.profile.lastName,
      gender: agent.profile.gender,
      otherName: agent.profile.otherName,
      email: UserEmail(address: agent.profile.email.address),
    );
  }

  factory RegistrationResponse.fromMap(dynamic map) {
    if (null == map) return null;
    return RegistrationResponse(
      agent: UserExtra.fromMap(map['agent']),
      message: map['message']?.toString(),
    );
  }
}
