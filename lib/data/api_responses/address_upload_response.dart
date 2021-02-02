import 'package:avs/data/models/tokens.dart';
import 'package:avs/data/models/user_extra.dart';

class AddressUploadResponse {
//JsonName:agent
  UserExtra agent;

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
    return AddressUploadResponse(
      agent: UserExtra.fromMap(map['agent']),
      tokens: Tokens.fromMap(map['tokens']),
      message: map['message']?.toString(),
    );
  }
}
