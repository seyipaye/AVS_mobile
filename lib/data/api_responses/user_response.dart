class UserResponseTokensRefresh {
//JsonName:expires
  String expires;

//JsonName:token
  String token;

  UserResponseTokensRefresh({
    this.expires,
    this.token,
  });
}

class UserResponse {
//JsonName:tokens
  UserResponseTokens tokens;

//JsonName:message
  String message;

//JsonName:user
  UserResponseUser user;

  UserResponse({
    this.tokens,
    this.message,
    this.user,
  });
}

class UserResponseTokensAccess {
//JsonName:expires
  String expires;

//JsonName:token
  String token;

  UserResponseTokensAccess({
    this.expires,
    this.token,
  });
}

class UserResponseUser {
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

  UserResponseUser({
    this.createdAt,
    this.mobile,
    this.authMethods,
    this.id,
    this.type,
    this.email,
    this.updatedAt,
  });
}

class UserResponseTokens {
//JsonName:access
  UserResponseTokensAccess access;

//JsonName:refresh
  UserResponseTokensRefresh refresh;

  UserResponseTokens({
    this.access,
    this.refresh,
  });
}
