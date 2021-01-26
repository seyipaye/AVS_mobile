import 'package:equatable/equatable.dart';

class Tokens extends Equatable {
//JsonName:access
  final LoginResponseTokensAccess access;

//JsonName:refresh
  final LoginResponseTokensRefresh refresh;

  Tokens({
    this.access,
    this.refresh,
  });

  Map<String, dynamic> toJson() {
    return {'access': access.toJson(), 'refresh': refresh.toJson()};
  }

  factory Tokens.fromMap(dynamic map) {
    if (null == map) return null;
    return Tokens(
      access: LoginResponseTokensAccess.fromMap(map['access']),
      refresh: LoginResponseTokensRefresh.fromMap(map['refresh']),
    );
  }

  @override
  List<Object> get props => [access, refresh];
}

class LoginResponseTokensAccess extends Equatable {
//JsonName:expires
  final String expires;

//JsonName:token
  final String token;

  LoginResponseTokensAccess({
    this.expires,
    this.token,
  });

  Map<String, String> toJson() {
    return {'expires': expires, 'token': token};
  }

  factory LoginResponseTokensAccess.fromMap(dynamic map) {
    if (null == map) return null;
    return LoginResponseTokensAccess(
      expires: map['expires']?.toString(),
      token: map['token']?.toString(),
    );
  }

  @override
  List<Object> get props => [expires, token];
}

class LoginResponseTokensRefresh extends Equatable {
//JsonName:expires
  final String expires;

//JsonName:token
  final String token;

  LoginResponseTokensRefresh({
    this.expires,
    this.token,
  });

  Map<String, String> toJson() {
    return {'expires': expires, 'token': token};
  }

  factory LoginResponseTokensRefresh.fromMap(dynamic map) {
    if (null == map) return null;
    return LoginResponseTokensRefresh(
      expires: map['expires']?.toString(),
      token: map['token']?.toString(),
    );
  }

  @override
  List<Object> get props => [expires, token];
}
